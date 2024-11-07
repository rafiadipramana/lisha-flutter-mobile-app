import 'package:get/get.dart';

import '../controllers/freelancer_payment_method_controller.dart';

class FreelancerPaymentMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FreelancerPaymentMethodController>(
      () => FreelancerPaymentMethodController(),
    );
  }
}
