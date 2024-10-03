import '../data_sources/remote/appointment_remote_data_source.dart';
import '../../domain/entities/appoitment.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../mappers/appointment_mapper.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentRemoteDataSource appointmentRemoteDataSource;

  AppointmentRepositoryImpl({
    required this.appointmentRemoteDataSource,
  });

  @override
  Future<List<Appointment>> getClientAppointments() async {
    try {
      final appointmentModels = await appointmentRemoteDataSource.getClientAppointments();
      return appointmentModels.map((e) => AppointmentMapper.fromModel(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Appointment>> getFreelancerAppointments() async {
    try {
      final appointmentModels = await appointmentRemoteDataSource.getFreelancerAppointments();
      return appointmentModels.map((e) => AppointmentMapper.fromModel(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
