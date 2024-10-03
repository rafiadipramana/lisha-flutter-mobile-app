import 'package:get/get.dart';

import '../controllers/freelancer_chatroom_controller.dart';

class FreelancerChatroomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FreelancerChatroomController>(
      () => FreelancerChatroomController(),
    );
  }
}
