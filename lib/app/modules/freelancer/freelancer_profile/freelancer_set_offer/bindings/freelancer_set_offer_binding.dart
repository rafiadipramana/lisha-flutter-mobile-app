import 'package:get/get.dart';

import '../controllers/freelancer_set_offer_controller.dart';

class FreelancerSetOfferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FreelancerSetOfferController>(
      () => FreelancerSetOfferController(),
    );
  }
}
