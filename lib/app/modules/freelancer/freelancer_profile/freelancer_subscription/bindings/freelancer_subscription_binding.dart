import 'package:get/get.dart';

import '../controllers/freelancer_subscription_controller.dart';

class FreelancerSubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FreelancerSubscriptionController>(
      () => FreelancerSubscriptionController(),
    );
  }
}
