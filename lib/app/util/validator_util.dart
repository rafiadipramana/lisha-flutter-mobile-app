import 'package:get/get_utils/src/extensions/string_extensions.dart';

class ValidatorUtil {
  static String? validateIsEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    if (!email.isEmail) {
      return 'Invalid email';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password.length >= 8) {
      return null;
    }
    return 'Password must be at least 8 characters';
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm password is required';
    }
    if (confirmPassword == password) {
      return null;
    }
    return 'Password does not match';
  }
}