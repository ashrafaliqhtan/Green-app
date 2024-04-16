class GSIUser {
  String? id;
  String? name;
  String? typeRole;
  String? phoneNumber;
  String? email;

  GSIUser({
    this.id,
    this.name,
    this.typeRole,
    this.phoneNumber,
    this.email,

  });

  factory GSIUser.fromJson(Map<String, dynamic> json) {
    return GSIUser(
      id: json['id'],
      name: json['name'],
      typeRole: json['type_role'],
      phoneNumber: json['phone_number'],
      email: json['email'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type_role': typeRole,
      'phone_number': phoneNumber,
      'email': email,

    };
  }
}
