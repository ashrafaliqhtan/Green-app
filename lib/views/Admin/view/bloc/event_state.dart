part of 'event_bloc.dart';

@immutable
sealed class EventState {}

final class EventInitial extends EventState {}

final class EventLoadingState extends EventState {}

final class EventLoadedState extends EventState {
  final List<EventModel> list;
  EventLoadedState({required this.list});
}

final class EventSuccessState extends EventState {
  final String msg;
  EventSuccessState({required this.msg});
}

final class EventErrorState extends EventState {
  final String msg;
  EventErrorState({required this.msg});
}