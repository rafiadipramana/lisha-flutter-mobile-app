import 'package:lisha/app/domain/entities/appointment.dart';

import '../repositories/appointment_repository.dart';

class AddAppointmentUseCase {
  final AppointmentRepository appointmentRepository;

  AddAppointmentUseCase({
    required this.appointmentRepository,
  });

  Future<List<Appointment>> execute(Appointment appointment) async {
    try {
      return await appointmentRepository.createAppointment(appointment);
    } catch (e) {
      rethrow;
    }
  }
}