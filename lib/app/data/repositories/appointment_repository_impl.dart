import '../data_sources/remote/appointment_remote_data_source.dart';
import '../mappers/appointment_mapper.dart';
import '../../domain/entities/appointment.dart';
import '../../domain/repositories/appointment_repository.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentRemoteDataSource appointmentRemoteDataSource;

  AppointmentRepositoryImpl({
    required this.appointmentRemoteDataSource,
  });

  @override
  Future<List<Appointment>> getClientAppointments() async {
    try {
      final appointmentModels = await appointmentRemoteDataSource.getClientAppointments();
      return AppointmentMapper.fromModelList(appointmentModels);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Appointment>> getFreelancerAppointments() async {
    try {
      final appointmentModels = await appointmentRemoteDataSource.getFreelancerAppointments();
      return AppointmentMapper.fromModelList(appointmentModels);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Appointment>> createAppointment(Appointment appointment) async {
    try {
      final appointmentModels = await appointmentRemoteDataSource.createAppointment(AppointmentMapper.fromEntity(appointment));
      return AppointmentMapper.fromModelList(appointmentModels);
    } catch (e) {
      rethrow;
    }
  }
}
