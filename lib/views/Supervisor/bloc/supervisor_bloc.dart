import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/model/gsi_user.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supervisor_event.dart';
part 'supervisor_state.dart';

class SupervisorBloc extends Bloc<SupervisorEvent, SupervisorState> {
  List<GSIUser> listOfSupervisor = [];
  SupervisorBloc() : super(SupervisorInitial()) {
    on<SupervisorEvent>((event, emit) {});
    on<ScanQR>(scanQR);
    on<LoadSupervisors>(loadSupervisors);
  }

  FutureOr<void> scanQR(ScanQR event, Emitter<SupervisorState> emit) async {
    try {
      String qrResult = await FlutterBarcodeScanner.scanBarcode(
          '#2A99CF', 'إلغاء', true, ScanMode.BARCODE);
      print("---------qr----------");
      print(qrResult);
      print("-------------------");
      if (qrResult == '-1') {
        emit(SupervisorScanCanceled());
      } else {
        print("1");
        try {
          var userId =
              await GetIt.I.get<DBServices>().getAttendees(id: qrResult);
          print("-------------------");
          print(userId);
          print("-------------------");
          if (userId != qrResult) {
            GetIt.I
                .get<DBServices>()
                .addVolunteerHours(addVolunteerHour: 8, volunteerID: qrResult);
            emit(SupervisorScanSuccess(qrResult));
          } else {
            emit(SupervisorScanErrorUser());
          }
        } on PostgrestException catch (e) {
          print("----------Problem1---------");
          print(e.code);
          print(e.message);
          print("-------------------");
          emit(SupervisorScanFailure());
        } catch (e) {
          print("----------Problem2---------");
          print(e);
          print("-------------------");
          emit(SupervisorScanFailure());
        }
      }
    } catch (e) {
      print("----------Problem3---------");
      print(e);
      print("-------------------");
      emit(SupervisorScanFailure());
    }
  }

  FutureOr<void> loadSupervisors(
      LoadSupervisors event, Emitter<SupervisorState> emit) async {
    emit(SupervisorLoading());
    try {
      listOfSupervisor = await GetIt.I.get<DBServices>().getSupervisors();
      if (listOfSupervisor.isNotEmpty) {
        emit(SupervisorLoad(supervisor: listOfSupervisor));
      } else {
        emit(SupervisorInitial());
      }
    } catch (_) {}
  }
}
