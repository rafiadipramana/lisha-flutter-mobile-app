import 'package:get/get.dart';

import '../controllers/client_book_appointment_detail_controller.dart';

class ClientBookAppointmentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientBookAppointmentDetailController>(
      () => ClientBookAppointmentDetailController(),
    );
  }
}
