import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/model/event_model.dart';
import 'package:green_saudi_app/model/personal_event.dart';
import 'package:green_saudi_app/service/supabase/supabase_services.dart';
import 'package:meta/meta.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final locator = GetIt.I.get<DBServices>();
  List<PersonalEvent> listOfPersonalEvents = [];
  List<EventModel> listOfEvent = [];
  List<EventModel> listOfOrderEvent = [];

  EventBloc() : super(EventInitial()) {
    on<EventEvent>((event, emit) {});
    on<EventLoadEvent>(loadEventData);
    on<EventAdded>(addEvent);
    on<RegisterEvent>(registerEvent);
    on<HistoryLoadEvent>(loadHistory);
    on<EventSearchEvent>(loadSearchEventData);
    on<EventRegionEvent>(loadSearchRegion);
  }
  Future<void> loadEventData(
      EventLoadEvent event, Emitter<EventState> emit) async {
    emit(EventLoadingState());
    try {
      listOfEvent = await locator.getAllEvent(event.order);
      if (listOfEvent.isNotEmpty) {
        emit(EventLoadedState(list: listOfEvent));
      } else {
        emit(EventInitial());
      }
    } catch (e) {
      emit(EventErrorState(
          msg: "حدث خطأ أثناء تحميل البيانات من قاعدة البيانات"));
    }
  }

  Future<void> addEvent(EventAdded event, Emitter<EventState> emit) async {
    if (event.event.title!.trim().isNotEmpty &&
        event.event.description!.trim().isNotEmpty &&
        event.event.location!.trim().isNotEmpty &&
        event.event.locationUrl!.trim().isNotEmpty) {
      if (event.event.maximumCapacity != null &&
          event.event.maximumCapacity != 0) {
        if (event.event.startDate!.isNotEmpty &&
            event.event.endDate!.isNotEmpty) {
          if (event.event.imageUrl!.trim().isNotEmpty) {
            try {
              await locator.createEvent(event: event.event);
              emit(EventSuccessState(msg: "تمت إضافة الحدث بنجاح"));
            } catch (e) {
              emit(EventErrorState(msg: "حدث خطأ أثناء إضافة الحدث"));
            }
          } else {
            emit(EventErrorState(msg: "الرجاء إدخال صوره الغلاف"));
          }
        } else {
          emit(EventErrorState(msg: "الرجاء إدخال ناريخ البدأ و الانهاء"));
        }
      } else {
        emit(EventErrorState(msg: "الرجاء إدخال القدرة الإستيعابية"));
      }
    } else {
      emit(EventErrorState(msg: "يرجى ملء جميع الحقول المطلوبة."));
    }
  }

  FutureOr<void> registerEvent(
      RegisterEvent event, Emitter<EventState> emit) async {
    emit(EventLoadingState());
    try {
      var checkRegister =
          await locator.checkRegister(eventId: event.personalEvent.eventId!);
      if (checkRegister["event_id"] == event.personalEvent.eventId!) {
        emit(RegisterEventErrorState(msg: "مسجل مسبقا"));
      } else {
        try {
          await locator.participateEvent(event: event.personalEvent);
          emit(RegisterEventSuccessState(msg: "تم تسجيل الحدث بنجاح"));
        } catch (e) {
          emit(RegisterEventErrorState(msg: "حدث خطأ في تسجيل الحدث"));
        }
      }
    } catch (e) {
      await locator.participateEvent(event: event.personalEvent);
      emit(RegisterEventSuccessState(msg: "تم تسجيل الحدث بنجاح"));
    }
  }

  Future<void> loadSearchEventData(
      EventSearchEvent event, Emitter<EventState> emit) async {
    emit(EventLoadingState());
    try {
      if (event.search.trim().isNotEmpty) {
        listOfOrderEvent =
            await locator.getAllEventSearch(event.order, event.search);
        if (listOfOrderEvent.isNotEmpty) {
          emit(EventLoadedState(list: listOfOrderEvent));
        } else {
          emit(EventInitial());
        }
      } else {
        emit(EventLoadedState(list: listOfEvent));
      }
    } catch (e) {
      emit(EventErrorState(
          msg: "حدث خطأ أثناء تحميل البيانات من قاعدة البيانات"));
    }
  }

  FutureOr<void> loadHistory(
      HistoryLoadEvent event, Emitter<EventState> emit) async {
    emit(EventLoadingState());
    try {
      listOfPersonalEvents = await locator.getUserEvents(id: locator.userID);
      List<EventModel> listOfEvents = await locator.getAllEvent(true);
      List<Map<String, dynamic>> listOfEvent = [];
      for (var element in listOfEvents) {
        for (var index = 0; index < listOfPersonalEvents.length; index++) {
          if (element.id == listOfPersonalEvents[index].eventId) {
            listOfEvent.add({
              "event": element,
              "personalEvent": listOfPersonalEvents[index]
            });
          }
        }
      }
      if (listOfEvent.isNotEmpty) {
        emit(HistoryLoadedState(event: listOfEvent));
      } else {
        emit(EventInitial());
      }
    } catch (_) {}
  }

  FutureOr<void> loadSearchRegion(
      EventRegionEvent event, Emitter<EventState> emit) async {
    emit(EventLoadingState());
    try {
      if (event.search.trim().isNotEmpty) {
        listOfOrderEvent =
            await locator.getAllEventRegion(event.order, event.search);
        if (listOfOrderEvent.isNotEmpty) {
          emit(EventLoadedState(list: listOfOrderEvent));
        } else {
          emit(EventInitial());
        }
      } else {
        emit(EventLoadedState(list: listOfEvent));
      }
    } catch (e) {
      emit(EventErrorState(
          msg: "حدث خطأ أثناء تحميل البيانات من قاعدة البيانات"));
    }
  }
}
