import 'package:lisha/app/domain/entities/appointment.dart';
import 'package:lisha/app/domain/repositories/appointment_repository.dart';

class GetClientAppointmentsUseCase {
  final AppointmentRepository appointmentRepository;

  GetClientAppointmentsUseCase({
    required this.appointmentRepository,
  });

  Future<List<Appointment>> execute() async {
    try {
      return await appointmentRepository.getClientAppointments();
    } catch (e) {
      rethrow;
    }
  }
}
