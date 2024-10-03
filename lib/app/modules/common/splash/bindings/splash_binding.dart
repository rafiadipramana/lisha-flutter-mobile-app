import 'package:get/get.dart';
import 'package:lisha/app/modules/common/splash/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
