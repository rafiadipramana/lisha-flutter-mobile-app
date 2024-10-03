import 'package:get/get.dart';

import '../controllers/edit_freelancer_service_controller.dart';

class EditFreelancerServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditFreelancerServiceController>(
      () => EditFreelancerServiceController(),
    );
  }
}
