part of 'reward_bloc.dart';

@immutable
sealed class RewardState {}

final class RewardInitial extends RewardState {}

final class RewardLoadingState extends RewardState {}

final class RewardLoadedState extends RewardState {
  final List<RewardModel> list;
  RewardLoadedState({required this.list});
}

final class RewardSuccessState extends RewardState {
  final String msg;
  RewardSuccessState({required this.msg});
}

final class RewardErrorState extends RewardState {
  final String msg;
  RewardErrorState({required this.msg});
}

//Points
final class RewardLoadState extends RewardState {
  final List<HistoryPointModel> historyPoints;
  final int point;
  RewardLoadState({required this.historyPoints, required this.point});
}

final class RewardPointSuccessState extends RewardState {
  final String msg;
  RewardPointSuccessState({required this.msg});
}

final class RewardPointErrorState extends RewardState {
  final String msg;
  RewardPointErrorState({required this.msg});
}
