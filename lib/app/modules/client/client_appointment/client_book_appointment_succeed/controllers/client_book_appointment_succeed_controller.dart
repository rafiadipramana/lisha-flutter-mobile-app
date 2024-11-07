import 'package:get/get.dart';
import 'package:lisha/app/domain/entities/appointment.dart';
import 'package:lisha/app/global/navigation_service.dart';

class ClientBookAppointmentSucceedController extends GetxController {
  late final Appointment _appointment;
  Appointment get appointment => _appointment;

  @override
  void onInit() {
    super.onInit();
    NavigationService.complete('result', true);
    _appointment = Get.arguments as Appointment;
  }

  void back() {
    Get.back();
  }
}
