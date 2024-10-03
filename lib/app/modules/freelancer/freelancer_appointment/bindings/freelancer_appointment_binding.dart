import 'package:get/get.dart';

import '../controllers/freelancer_appointment_controller.dart';

class FreelancerAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FreelancerAppointmentController>(
      () => FreelancerAppointmentController(),
    );
  }
}
