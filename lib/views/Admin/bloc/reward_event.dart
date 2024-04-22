part of 'reward_bloc.dart';

@immutable
sealed class RewardEvent {}

class RewardLoadEvent extends RewardEvent {}

class RewardAdded extends RewardEvent {
  final RewardModel reward;

  RewardAdded({required this.reward});
}

class RewardDeleted extends RewardEvent {
  final RewardModel reward;

  RewardDeleted({required this.reward});
}

class RewardUpdated extends RewardEvent {
  final RewardModel reward;
  final String id;
  RewardUpdated({required this.reward, required this.id});
}

//Points
class RewardPointsLoad extends RewardEvent {}

class RewardRedeemPoint extends RewardEvent {}
