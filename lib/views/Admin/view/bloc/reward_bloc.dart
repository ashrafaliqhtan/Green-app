import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/model/reward_model.dart';
import 'package:green_saudi_app/service/supabase_services.dart';
import 'package:meta/meta.dart';

part 'reward_event.dart';
part 'reward_state.dart';

class RewardBloc extends Bloc<RewardEvent, RewardState> {
  final locator = GetIt.I.get<DBServices>();
  List<RewardModel> listOfReward = [];
  RewardBloc() : super(RewardInitial()) {
    on<RewardEvent>((event, emit) {});
    on<RewardLoadEvent>(loadRewardData);
    on<RewardAdded>(addReward);
    //on<EventDeleted>(deleteEvent);
  }
  Future<void> loadRewardData(
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

  Future<void> addReward(RewardAdded event, Emitter<RewardState> emit) async {
    if (event.reward.rewardCompanyName!.trim().isNotEmpty &&
        event.reward.rewardContent!.trim().isNotEmpty &&
        event.reward.rewardName!.isNotEmpty) {
      if (event.reward.rewardCompanyLogo!.trim().isNotEmpty) {
        try {
          await locator.createReward(reward: event.reward);
          emit(RewardSuccessState(msg: "تمت إضافة  المكافاة بنجاح"));
        } catch (e) {
          emit(RewardErrorState(msg: "حدث خطأ أثناء إضافة المكافاة"));
        }
      }else{
        emit(RewardErrorState(msg: "الرجاء إدخال صوره الغلاف"));
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
