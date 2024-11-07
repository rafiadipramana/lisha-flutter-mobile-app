class UserModel {
  final int? id;
  final String? uid;
  final String firstName;
  final String lastName;
  final String country;
  final String profileImageUrl;
  final String role;

  UserModel({
    this.id,
    this.uid,
    required this.firstName,
    required this.lastName,
    required this.country,
    required this.profileImageUrl,
    this.role = 'client',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      uid: json['uid'] ?? '',
      firstName: json['first_name'],
      lastName: json['last_name'],
      country: json['country'],
      profileImageUrl: json['profile_image_url'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (uid != null) 'uid': uid,
      'first_name': firstName,
      'last_name': lastName,
      'country': country,
      'profile_image_url': profileImageUrl,
      'role': role,
    };
  }
}
