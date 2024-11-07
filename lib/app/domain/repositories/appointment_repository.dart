import '../entities/appointment.dart';

abstract class AppointmentRepository {
  Future<List<Appointment>> getFreelancerAppointments();
  Future<List<Appointment>> getClientAppointments();
  Future<List<Appointment>> createAppointment(Appointment appointment);
}