import 'package:get/get.dart';

import '../controllers/client_book_appointment_time_chooser_controller.dart';

class ClientBookAppointmentTimeChooserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientBookAppointmentTimeChooserController>(
      () => ClientBookAppointmentTimeChooserController(),
    );
  }
}
