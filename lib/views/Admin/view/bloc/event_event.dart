part of 'event_bloc.dart';

@immutable
sealed class EventEvent {}

class EventLoadEvent extends EventEvent {}

class EventAdded extends EventEvent {
  final EventModel event;

  EventAdded({required this.event});
}

class EventDeleted extends EventEvent {
  final EventModel event;

  EventDeleted({required this.event});
}

class EventUpdated extends EventEvent {
  final EventModel event;
  final String id;
  EventUpdated({required this.event, required this.id});
}