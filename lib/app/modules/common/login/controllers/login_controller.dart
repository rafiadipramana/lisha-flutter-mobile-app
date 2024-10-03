import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lisha/app/routes/app_pages.dart';
import 'package:lisha/app/widgets/app_snackbar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../domain/use_cases/login_use_case.dart';

class LoginController extends GetxController {
  late final TextEditingController _emailController;
  TextEditingController get emailController => _emailController;

  late final TextEditingController _passwordController;
  TextEditingController get passwordController => _passwordController;

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> get loginFormKey => _loginFormKey;

  @override
  void onInit() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.onClose();
  }

  navigateToForgotPasswordPage() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  navigateToRootPage() {
    Get.offAllNamed(Routes.ROOT);
  }

  navigateToRegisterPage() {
    Get.offNamedUntil(Routes.REGISTER, (route) => false);
  }

  void validateForm() {
    if (_loginFormKey.currentState!.validate()) {
      login();
    }
  }

  Future<void> login() async {
    try {
      _isLoading.value = true;
      final LoginUseCase loginUseCase = Get.find<LoginUseCase>();
      await loginUseCase.execute(
        email: _emailController.text,
        password: _passwordController.text,
      );
      _isLoading.value = false;
      navigateToRootPage();
    } catch (e) {
      _isLoading.value = false;
      if (e is AuthException) {
        AppSnackBar(message: e.message);
      }
    }
  }
}
