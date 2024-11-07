class AuthModel {
  final String? username;
  final String firstName;
  final String lastName;
  final String country;
  final String? role;

  AuthModel({
    this.username,
    required this.firstName,
    required this.lastName,
    required this.country,
    this.role = 'client',
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      country: json['country'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'country': country,
      'role': role,
    };
  }
}
