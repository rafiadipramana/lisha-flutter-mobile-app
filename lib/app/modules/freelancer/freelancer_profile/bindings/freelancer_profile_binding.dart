import 'package:get/get.dart';
import 'package:lisha/app/modules/freelancer/freelancer_profile/controllers/freelancer_profile_controller.dart';

class FreelancerProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FreelancerProfileController>(
      () => FreelancerProfileController(),
    );
  }
}
