class GSIUser {
  String? id;
  String? name;
  String? typeRole;
  String? phoneNumber;
  String? email;
  String? password;
  String? confirmPassword;

  GSIUser({
    this.id,
    this.name,
    this.typeRole,
    this.phoneNumber,
    this.email,
    this.password,
    this.confirmPassword,
  });

  factory GSIUser.fromJson(Map<String, dynamic> json) {
    return GSIUser(
      id: json['id'],
      name: json['name'],
      typeRole: json['type_role'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirm_password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type_role': typeRole,
      'phone_number': phoneNumber,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    };
  }
}
