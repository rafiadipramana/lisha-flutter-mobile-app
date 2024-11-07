import 'package:lisha/app/domain/entities/time_slot.dart';
import 'package:lisha/app/domain/entities/user.dart';

class Appointment {
  final int? id;
  final String freelancerId;
  final String? clientId;
  final TimeSlot time;
  final DateTime date;
  final DateTime? createdAt;
  final String fullName;
  final String email;
  final Map<String, dynamic>? guests;
  final String? description;
  final User? freelancer;
  final User? client;

  Appointment({
    this.id,
    required this.freelancerId,
    this.clientId,
    required this.time,
    required this.date,
    this.createdAt,
    required this.fullName,
    required this.email,
    this.guests,
    this.description,
    this.freelancer,
    this.client,
  });
}