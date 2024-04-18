class GSIUser {
  String? id;
  String? name;
  String? typeRole;
  String? phoneNumber;
  String? city;
  int? volunteerHours;
  int? points;

  GSIUser({
    this.id,
    this.name,
    this.typeRole,
    this.phoneNumber,
    this.city,
    this.volunteerHours,
    this.points,
  });

  factory GSIUser.fromJson(Map<String, dynamic> json) {
    return GSIUser(
      id: json['id_user'] as String?,
      name: json['name'] as String?,
      typeRole: json['type_role'] as String?,
      phoneNumber: json['phone'] as String?,
      city: json['city'] as String?,
      volunteerHours: json['volunteer_hours'] != null ? int.tryParse(json['volunteer_hours'].toString()) : null,
      points: json['points'] != null ? int.tryParse(json['points'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_user': id,
      'name': name,
      'type_role': typeRole,
      'phone': phoneNumber,
      'city': city,
      'volunteer_hours': volunteerHours,
      'points': points,
    };
  }
}
