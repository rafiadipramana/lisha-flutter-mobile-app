class Appointment {
  final int id;
  final String freelancerId;
  final String clientId;
  final String time;
  final String date;
  final String createdAt;
  final String fullName;
  final String email;
  final Map<String, dynamic>? guests;
  final String? description;

  Appointment({
    required this.id,
    required this.freelancerId,
    required this.clientId,
    required this.time,
    required this.date,
    required this.createdAt,
    required this.fullName,
    required this.email,
    this.guests,
    this.description,
  });
}