import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lisha/app/domain/use_cases/sign_up_use_case.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../routes/app_pages.dart';
import '../../../../widgets/app_snackbar.dart';

class RegisterController extends GetxController {
  late final TextEditingController _usernameAndEmailController;
  TextEditingController get usernameAndEmailController => _usernameAndEmailController;

  late final TextEditingController _firstNameController;
  TextEditingController get firstNameController => _firstNameController;

  late final TextEditingController _lastNameController;
  TextEditingController get lastNameController => _lastNameController;

  late final TextEditingController _passwordController;
  TextEditingController get passwordController => _passwordController;

  late final TextEditingController _confirmPasswordController;
  TextEditingController get confirmPasswordController => _confirmPasswordController;

  late final TextEditingController _countryController;
  TextEditingController get countryController => _countryController;

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> get registerFormKey => _registerFormKey;

  @override
  void onInit() {
    _usernameAndEmailController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _countryController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    _usernameAndEmailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _countryController.dispose();
    super.onClose();
  }

  navigateToLoginPage() {
    Get.offNamedUntil(Routes.LOGIN, (route) => false);
  }

  void validateForm() {
    if (_registerFormKey.currentState!.validate()) {
      register();
    }
  }

  Future<void> register() async {
    try {
      _isLoading.value = true;
      final SignUpUseCase signUpUseCase = Get.find<SignUpUseCase>();
      await signUpUseCase.execute(
        email: _usernameAndEmailController.text,
        username: _usernameAndEmailController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        password: _passwordController.text,
        country: _countryController.text,
      );
      _isLoading.value = false;
      navigateToLoginPage();
    } catch (e) {
      _isLoading.value = false;
      if (e is AuthException) {
        AppSnackBar(message: e.message);
      }
    }
  }
}
