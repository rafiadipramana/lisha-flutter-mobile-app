import 'package:get/get.dart';

import '../controllers/client_appointment_controller.dart';

class ClientAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientAppointmentController>(
      () => ClientAppointmentController(),
    );
  }
}
