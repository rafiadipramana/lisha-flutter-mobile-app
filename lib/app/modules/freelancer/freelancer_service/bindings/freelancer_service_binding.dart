import 'package:get/get.dart';

import '../controllers/freelancer_service_controller.dart';

class FreelancerServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FreelancerServiceController>(
      () => FreelancerServiceController(),
    );
  }
}
