import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:lisha/app/domain/use_cases/check_login_status_use_case.dart';
import 'package:lisha/app/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    final CheckLoginStatusUsecase checkLoginStatusUseCase = Get.find<CheckLoginStatusUsecase>();
    Session? isLoggedIn = checkLoginStatusUseCase.execute();
    isLoggedIn != null ? _navigateToRoot() : _navigateToLogin();
    FlutterNativeSplash.remove();
    super.onReady();
  }

  void _navigateToRoot() {
    Get.offAllNamed(Routes.ROOT);
  }

  void _navigateToLogin() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
