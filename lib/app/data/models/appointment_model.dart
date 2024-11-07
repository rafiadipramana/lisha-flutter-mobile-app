import 'time_slot_model.dart';
import 'user_model.dart';

class AppointmentModel {
  final int? id;
  final String freelancerId;
  final String? clientId;
  final TimeSlotModel time;
  final DateTime date;
  final DateTime? createdAt;
  final String fullName;
  final String email;
  final Map<String, dynamic>? guests;
  final String? description;
  final UserModel? freelancer;
  final UserModel? client;

  AppointmentModel({
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

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'],
      freelancerId: json['freelancer_id'],
      clientId: json['client_id'] ?? '',
      time: TimeSlotModel.fromJson(json),
      date: DateTime.parse(json['date']),
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      fullName: json['full_name'],
      email: json['email'],
      guests: json['guests'] ?? {},
      description: json['description'] ?? '',
      freelancer: json.containsKey('freelancer') && json['freelancer'] is Map
          ? UserModel.fromJson(json['freelancer'])
          : null,
      client: json.containsKey('client') && json['client'] is Map
          ? UserModel.fromJson(json['client'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'freelancer_id': freelancerId,
      if (clientId != null) 'client_id': clientId,
      'time': time.time,
      'date': date.toIso8601String(),
      'duration': time.duration,
      'time_period': time.type.name.toLowerCase(),
      if (createdAt != null) 'created_at': createdAt,
      'full_name': fullName,
      'email': email,
      if (guests != null) 'guests': guests,
      if (description != null) 'description': description,
      if (freelancer != null) 'freelancer': freelancer!.toJson(),
      if (client != null) 'client': client!.toJson(),
    };
  }

  AppointmentModel copyWith({
    int? id,
    String? freelancerId,
    String? clientId,
    TimeSlotModel? time,
    String? date,
    String? createdAt,
    String? fullName,
    String? email,
    Map<String, dynamic>? guests,
    String? description,
    UserModel? freelancer,
    UserModel? client,
  }) {
    return AppointmentModel(
      id: id ?? this.id,
      freelancerId: freelancerId ?? this.freelancerId,
      clientId: clientId ?? this.clientId,
      time: time ?? this.time,
      date: date != null ? DateTime.parse(date) : this.date,
      createdAt: createdAt != null ? DateTime.parse(createdAt) : this.createdAt,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      guests: guests ?? this.guests,
      description: description ?? this.description,
    );
  }
}
