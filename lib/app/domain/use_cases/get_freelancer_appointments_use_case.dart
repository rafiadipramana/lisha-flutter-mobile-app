import 'package:lisha/app/domain/entities/appoitment.dart';
import 'package:lisha/app/domain/repositories/appointment_repository.dart';

class GetFreelancerAppointmentsUseCase {
  final AppointmentRepository appointmentRepository;

  GetFreelancerAppointmentsUseCase({
    required this.appointmentRepository,
  });

  Future<List<Appointment>> execute() async {
    try {
      return await appointmentRepository.getFreelancerAppointments();
    } catch (e) {
      rethrow;
    }
  }
}
