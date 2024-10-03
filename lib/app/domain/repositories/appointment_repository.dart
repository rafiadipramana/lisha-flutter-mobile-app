import '../entities/appoitment.dart';

abstract class AppointmentRepository {
  Future<List<Appointment>> getFreelancerAppointments();
  Future<List<Appointment>> getClientAppointments();
}