import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:green_saudi_app/model/history_point_model.dart';
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
    on<RewardPointsLoad>(loadPointHistory);
  }
  Future<void> loadRewardData(
      RewardLoadEvent event, Emitter<RewardState> emit) async {
    emit(RewardLoadingState());
    try {
      listOfReward = await locator.getAllReward();
      if (listOfReward.isNotEmpty) {
        emit(RewardLoadedState(list: listOfReward));
      } else {
        emit(RewardInitial());
      }
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
      } else {
        emit(RewardErrorState(msg: "الرجاء إدخال صوره الغلاف"));
      }
    } else {
      emit(RewardErrorState(msg: "يرجى ملء جميع الحقول المطلوبة."));
    }
  }

  FutureOr<void> loadPointHistory(
      RewardPointsLoad event, Emitter<RewardState> emit) async {
    try {
      var totalPoint = await locator.getUserPoint(id: locator.userID);
      var historyPoint = await locator.getHistoryPoint(id: locator.userID);
      emit(RewardLoadState(historyPoints: historyPoint, point: totalPoint));
    } catch (e) {
      print(e);
    }
  }
}
