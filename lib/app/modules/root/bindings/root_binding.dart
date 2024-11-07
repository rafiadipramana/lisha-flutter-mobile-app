import 'package:get/get.dart';
import 'package:lisha/app/modules/client/client_appointment/controllers/client_appointment_controller.dart';
import 'package:lisha/app/modules/client/client_home/controllers/client_home_controller.dart';
import 'package:lisha/app/modules/client/service/controllers/service_controller.dart';
import 'package:lisha/app/modules/freelancer/freelancer_appointment/controllers/freelancer_appointment_controller.dart';
import 'package:lisha/app/modules/freelancer/freelancer_chat/controllers/freelancer_chat_controller.dart';
import 'package:lisha/app/modules/freelancer/freelancer_profile/controllers/freelancer_profile_controller.dart';
import 'package:lisha/app/modules/freelancer/freelancer_service/controllers/freelancer_service_controller.dart';
import 'package:lisha/app/modules/freelancer/home/controllers/home_controller.dart';
import 'package:lisha/app/modules/root/controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.lazyPut<ClientHomeController>(
      () => ClientHomeController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ClientAppointmentController>(
      () => ClientAppointmentController(),
    );
    Get.lazyPut<FreelancerAppointmentController>(
      () => FreelancerAppointmentController(),
    );
    Get.lazyPut<FreelancerServiceController>(
      () => FreelancerServiceController(),
    );
    Get.lazyPut<ServiceController>(
      () => ServiceController(),
    );
    Get.lazyPut<FreelancerChatController>(
      () => FreelancerChatController(),
    );
    Get.lazyPut<FreelancerProfileController>(
      () => FreelancerProfileController(),
    );
  }
}
