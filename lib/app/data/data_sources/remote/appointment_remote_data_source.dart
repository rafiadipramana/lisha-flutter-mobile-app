import 'package:lisha/app/data/models/appointment_model.dart';
import 'package:lisha/app/data/services/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppointmentRemoteDataSource {
  final SupabaseClient client;

  AppointmentRemoteDataSource() : client = Supabase.instance.client;

  Future<List<AppointmentModel>> getFreelancerAppointments() async {
    try {
      final response = await client.from('appointment').select().eq('freelancer_id', SupabaseService.userId!);
      return response.map((e) => AppointmentModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AppointmentModel>> getClientAppointments() async {
    try {
      final response = await client.from('appointment').select().eq('client_id', SupabaseService.userId!);
      return response.map((e) => AppointmentModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
