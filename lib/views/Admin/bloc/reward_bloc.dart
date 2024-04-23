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
    on<RewardRedeemPoint>(redeemReward);
  }
  Future<void> loadRewardData(
      RewardLoadEvent event, Emitter<RewardState> emit) async {
    emit(RewardLoadingState());
    try {
      var totalPoint = await locator.getUserPoint(id: locator.userID);
      var historyPoint = await locator.getHistoryPoint(id: locator.userID);
      listOfReward = await locator.getAllReward();
      if (listOfReward.isNotEmpty || historyPoint.isNotEmpty) {
        emit(RewardLoadedState(
            list: listOfReward,
            historyPoints: historyPoint,
            point: totalPoint));
      } else {
        emit(RewardInitial());
      }
    } catch (e) {
      print(e);

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

  FutureOr<void> redeemReward(
      RewardRedeemPoint event, Emitter<RewardState> emit) async {
    emit(RewardLoadingState());
    try {
      final point = await locator.getUserPoint(id: locator.userID);
      if (point >= 80) {
        locator.usePoint(usedPoint: 80, volunteerID: locator.userID);
        emit(RewardPointSuccessState(msg: "تم استبدال النقاط بنجاح"));
      } else {
        emit(RewardPointErrorState(msg: "النقاط لا تاكفي لاستبدال"));
      }
    } catch (e) {
      emit(RewardPointErrorState(msg: "حدث خطأ في استبدال النقاط"));
      print(e);
    }
  }
}
