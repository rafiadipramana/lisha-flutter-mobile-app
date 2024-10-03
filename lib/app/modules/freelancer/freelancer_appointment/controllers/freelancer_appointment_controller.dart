import 'package:get/get.dart';
import '../../../../domain/entities/appoitment.dart';
import '../../../../domain/use_cases/get_freelancer_appointments_use_case.dart';

class FreelancerAppointmentController extends GetxController {
  late final RxList<Appointment> _appointments;
  List<Appointment> get appointments => _appointments;

  @override
  void onInit() {
    _appointments = <Appointment>[].obs;
    super.onInit();
  }

  @override
  void onReady() async {
    await getFreelancerAppointments();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getFreelancerAppointments() async {
    final getFreelancerAppointmentsUseCase = Get.find<GetFreelancerAppointmentsUseCase>();
    final result = await getFreelancerAppointmentsUseCase.execute();
    _appointments.assignAll(result);
  }
}
