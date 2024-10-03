import 'package:get/get.dart';

import '../controllers/add_freelancer_service_controller.dart';

class AddFreelancerServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddFreelancerServiceController>(
      () => AddFreelancerServiceController(),
    );
  }
}
