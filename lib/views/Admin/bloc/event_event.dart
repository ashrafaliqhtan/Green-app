part of 'event_bloc.dart';

@immutable
sealed class EventEvent {}

class EventLoadEvent extends EventEvent {
  final bool order;
  EventLoadEvent({required this.order});
}

class HistoryLoadEvent extends EventEvent {}

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

class EventSearchEvent extends EventEvent {
  final bool order;
  final String search;
  EventSearchEvent({required this.order, required this.search});
}

class EventRegionEvent extends EventEvent {
  final bool order;
  final String search;
  EventRegionEvent({required this.order, required this.search});
}

class RegisterEvent extends EventEvent {
  final PersonalEvent personalEvent;
  RegisterEvent({required this.personalEvent});
}
