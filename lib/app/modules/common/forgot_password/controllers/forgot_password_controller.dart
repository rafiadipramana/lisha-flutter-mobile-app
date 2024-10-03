import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../domain/use_cases/reset_password_by_email_use_case.dart';
import '../../../../routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  late final TextEditingController _emailController;
  TextEditingController get emailController => _emailController;

  final GlobalKey<FormState> _forgotPasswordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> get forgotPasswordFormKey => _forgotPasswordFormKey;

  @override
  void onInit() {
    _emailController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    _emailController.dispose();
    super.onClose();
  }

  void navigateToRegister() {
    Get.offNamedUntil(Routes.REGISTER, (route) => false);
  }

  void validateForm() {
    if (_forgotPasswordFormKey.currentState!.validate()) {
      sendResetPasswordEmail();
    }
  }

  Future<void> sendResetPasswordEmail() async {
    try {
      await Get.find<ResetPasswordByEmailUseCase>().execute(email: emailController.text);
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while sending the email');
      rethrow;
    }
  }
}
