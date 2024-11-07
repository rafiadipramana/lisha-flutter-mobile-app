class User {
  final int? id;
  final String? uid;
  final String firstName;
  final String lastName;
  final String country;
  final String profileImageUrl;
  final String role;

  User({
    this.id,
    this.uid,
    required this.firstName,
    required this.lastName,
    required this.country,
    required this.profileImageUrl,
    this.role = 'client',
  });
}