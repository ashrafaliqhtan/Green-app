import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/model/event_model.dart';
import 'package:green_saudi_app/model/gsi_user.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supervisor_event.dart';
part 'supervisor_state.dart';

class SupervisorBloc extends Bloc<SupervisorEvent, SupervisorState> {
  List<GSIUser> supervisor = [];

  SupervisorBloc() : super(SupervisorInitial()) {
    on<SupervisorEvent>((event, emit) {});
    on<ScanQR>(scanQR);
    on<LoadSupervisors>(loadSupervisor);
  }

  FutureOr<void> scanQR(ScanQR event, Emitter<SupervisorState> emit) async {
    try {
      String qrResult = await FlutterBarcodeScanner.scanBarcode(
          '#2A99CF', 'إلغاء', true, ScanMode.BARCODE);
      if (qrResult == '-1') {
        emit(SupervisorScanCanceled());
      } else {
        try {
          var userId =
              await GetIt.I.get<DBServices>().getAttendees(id: qrResult);
          if (userId != qrResult) {
            GetIt.I.get<DBServices>().addVolunteerHours(
                addVolunteerHour: 8, volunteerID: qrResult, eventID: event.event.id!);
            emit(SupervisorScanSuccess(qrResult));
          } else {
            emit(SupervisorScanErrorUser());
          }
        } on PostgrestException catch (e) {
          emit(SupervisorScanFailure());
        }
      }
    } catch (e) {
      emit(SupervisorScanFailure());
    }
  }

  

  FutureOr<void> loadSupervisor(
      LoadSupervisors event, Emitter<SupervisorState> emit) async {
    emit(SupervisorLoading());
    try {
      supervisor = await GetIt.I.get<DBServices>().getSupervisors();
      if (supervisor.isNotEmpty) {
        emit(SupervisorLoad(supervisor: supervisor));
      } else {
        emit(SupervisorInitial());
      }
    } catch (e) {
      emit(SupervisorInitial());
    }
  }
}
