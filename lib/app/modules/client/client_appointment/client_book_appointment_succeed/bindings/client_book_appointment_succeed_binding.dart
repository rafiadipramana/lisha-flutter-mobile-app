import 'package:get/get.dart';

import '../controllers/client_book_appointment_succeed_controller.dart';

class ClientBookAppointmentSucceedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientBookAppointmentSucceedController>(
      () => ClientBookAppointmentSucceedController(),
    );
  }
}
