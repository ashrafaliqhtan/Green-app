class PersonalEvent {
  String? name;
  String? event;
  String? stats;
  String? days;

  PersonalEvent({this.name, this.event, this.stats, this.days});

  factory PersonalEvent.fromJson(Map<String, dynamic> json) {
    return PersonalEvent(
      name: json['name'],
      event: json['event'],
      stats: json['stats'],
      days: json['days'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'event': event,
      'stats': stats,
      'days': days,
    };
  }
}
