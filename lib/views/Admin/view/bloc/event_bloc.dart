import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/model/event_model.dart';
import 'package:green_saudi_app/model/personal_event.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:meta/meta.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final locator = GetIt.I.get<DBServices>();
  List<PersonalEvent> listOfPersonalEvents = [];
  List<EventModel> listOfEvent = [];
  EventBloc() : super(EventInitial()) {
    on<EventEvent>((event, emit) {});
    on<EventLoadEvent>(loadEventData);
    on<EventAdded>(addEvent);
    on<RegisterEvent>(registerEvent);
    on<HistoryLoadEvent>(loadHistory);
    //on<EventDeleted>(deleteEvent);
  }
  Future<void> loadEventData(
      EventLoadEvent event, Emitter<EventState> emit) async {
    emit(EventLoadingState());
    try {
      listOfEvent = await locator.getAllEvent();

      emit(EventLoadedState(list: listOfEvent));
    } catch (e) {
      emit(EventErrorState(
          msg: "حدث خطأ أثناء تحميل البيانات من قاعدة البيانات"));
    }
  }

  Future<void> addEvent(EventAdded event, Emitter<EventState> emit) async {
    if (event.event.title!.trim().isNotEmpty) {
      try {
        await locator.createEvent(event: event.event);
        emit(EventLoadedState(list: listOfEvent));
        emit(EventSuccessState(msg: "تمت إضافة الحدث بنجاح"));
      } catch (e) {
        emit(EventErrorState(msg: "حدث خطأ أثناء إضافة الحدث"));
      }
    } else {
      emit(EventErrorState(msg: "يرجى ملء جميع الحقول المطلوبة."));
    }
  }

  // Future<void> deleteEvent(
  //     EventDeleted event, Emitter<EventState> emit) async {
  //   try {
  //     await locator.deleteEventData(event.event.id!);
  //     emit(EventLoadedState(list: listOfEvent));
  //     emit(EventSuccessState(msg: "تم حذف الدواء بنجاح"));
  //   } catch (e) {
  //     emit(EventErrorState(msg: "حدث خطأ أثناء حذف الدواء"));
  //   }
  // }

  FutureOr<void> registerEvent(
      RegisterEvent event, Emitter<EventState> emit) async {
    emit(EventLoadingState());
    try {
      await locator.participateEvent(event: event.personalEvent);

      emit(RegisterEventSuccessState(msg: "msg"));
    } catch (e) {
      emit(RegisterEventErrorState(msg: "msg"));
    }
  }

  FutureOr<void> loadHistory(
      HistoryLoadEvent event, Emitter<EventState> emit) async {
    emit(EventLoadingState());
    try {
      listOfPersonalEvents = await locator.getUserEvents(id: locator.userID);
      emit(HistoryLoadedState(history: listOfPersonalEvents));
    } catch (_) {}
  }
}
