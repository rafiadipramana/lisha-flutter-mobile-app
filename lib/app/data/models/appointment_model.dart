import 'package:flutter/material.dart';

class AppointmentModel {
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

  AppointmentModel({
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

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'] as int,
      freelancerId: json['freelancer_id'] as String,
      clientId: json['client_id'] as String,
      time: json['time'] as String,
      date: json['date'] as String,
      createdAt: json['created_at'] as String,
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      guests: json['guests'] as Map<String, dynamic>?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'freelancer_id': freelancerId,
      'client_id': clientId,
      'time': time,
      'date': date,
      'created_at': createdAt,
      'full_name': fullName,
      'email': email,
      'guests': guests,
      'description': description,
    };
  }
}