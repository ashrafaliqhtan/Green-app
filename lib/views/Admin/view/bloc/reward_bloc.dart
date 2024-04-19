import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/model/reward_model.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:meta/meta.dart';

part 'reward_event.dart';
part 'reward_state.dart';

class EventBloc extends Bloc<RewardEvent, RewardState> {
  final locator = GetIt.I.get<DBServices>();
  List<RewardModel> listOfReward = [];
  EventBloc() : super(RewardInitial()) {
    on<RewardEvent>((event, emit) {});
    on<RewardLoadEvent>(loadEventData);
    on<RewardAdded>(addEvent);
  //on<EventDeleted>(deleteEvent);
  }
  Future<void> loadEventData(
      RewardLoadEvent event, Emitter<RewardState> emit) async {
    emit(RewardLoadingState());
    try {
      listOfReward = await locator.getAllReward();
      emit(RewardLoadedState(list: listOfReward));
    } catch (e) {
      emit(RewardErrorState(
          msg: "حدث خطأ أثناء تحميل البيانات من قاعدة البيانات"));
    }
  }

  Future<void> addEvent(
      RewardAdded event, Emitter<RewardState> emit) async {
    if (event.reward.rewardId!.trim().isNotEmpty) {
      try {
        await locator.createReward(reward: event.reward);
        emit(RewardLoadedState(list: listOfReward));
        emit(RewardSuccessState(msg: "تمت إضافة الدواء بنجاح"));
      } catch (e) {
        emit(RewardErrorState(msg: "حدث خطأ أثناء إضافة الدواء"));
      }
    } else {
      emit(RewardErrorState(msg: "يرجى ملء جميع الحقول المطلوبة."));
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
}
