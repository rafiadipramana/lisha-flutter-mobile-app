import 'dart:developer';

import 'package:lisha/app/data/models/appointment_model.dart';
import 'package:lisha/app/data/services/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppointmentRemoteDataSource {
  final SupabaseClient client;

  AppointmentRemoteDataSource() : client = Supabase.instance.client;

  Future<List<AppointmentModel>> getFreelancerAppointments() async {
    try {
      final response = await client
          .from('appointment')
          .select()
          .eq('freelancer_id', SupabaseService.userId!);
      return response.map((e) => AppointmentModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AppointmentModel>> getClientAppointments() async {
    try {
      final response = await client
          .from('appointment')
          .select('''
            *,
            freelancer:freelancer_id(
              *
            )
          ''')
          .eq('client_id', SupabaseService.userId!)
          .order('date', ascending: false);
      log(response.toString());
      return response.map((e) => AppointmentModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AppointmentModel>> createAppointment(
      AppointmentModel appointment) async {
    try {
      final AppointmentModel newAppointment =
          appointment.copyWith(clientId: SupabaseService.userId!);
      final response = await client
          .from('appointment')
          .upsert(newAppointment.toJson())
          .select('''
            *,
            freelancer:freelancer_id(
              *
            )
          ''');
      log(response.toString());
      return response.map((e) => AppointmentModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
