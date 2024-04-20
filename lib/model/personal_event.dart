class PersonalEvent {
  String? name;
  String? eventId;
  String? stats;
  String? days;

  PersonalEvent({this.name, this.eventId, this.stats, this.days});

  factory PersonalEvent.fromJson(Map<String, dynamic> json) {
    return PersonalEvent(
      name: json['name'],
      eventId: json['event_id'],
      stats: json['stats'],
      days: json['days'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'event_id': eventId,
      'stats': stats,
      'days': days,
    };
  }
}
