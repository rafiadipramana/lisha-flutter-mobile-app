class AuthModel {
  final String? username;
  final String firstName;
  final String lastName;
  final String country;

  AuthModel({
    this.username,
    required this.firstName,
    required this.lastName,
    required this.country,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'country': country,
    };
  }
}
