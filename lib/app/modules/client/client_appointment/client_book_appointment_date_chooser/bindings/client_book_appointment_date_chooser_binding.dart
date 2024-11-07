import 'package:get/get.dart';
import '../controllers/client_book_appointment_date_chooser_controller.dart';

class ClientBookAppointmentDateChooserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientBookAppointmentDateChooserController>(
      () => ClientBookAppointmentDateChooserController(),
    );
  }
}
