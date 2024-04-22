class HistoryPoint {
  String id;
  DateTime createdAt;
  String point;
  String state;
  String userId;

  HistoryPoint({
    required this.id,
    required this.createdAt,
    required this.point,
    required this.state,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'point': point,
      'state': state,
      'user_id': userId,
    };
  }

  static HistoryPoint fromMap(Map<String, dynamic> map) {
    return HistoryPoint(
      id: map['id'],
      createdAt: DateTime.parse(map['created_at']),
      point: map['point'],
      state: map['state'],
      userId: map['user_id'],
    );
  }
}
