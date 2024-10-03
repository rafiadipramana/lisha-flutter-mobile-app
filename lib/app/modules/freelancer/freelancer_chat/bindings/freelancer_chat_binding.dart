import 'package:get/get.dart';

import '../controllers/freelancer_chat_controller.dart';

class FreelancerChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FreelancerChatController>(
      () => FreelancerChatController(),
    );
  }
}
