import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lisha/app/extensions/text_styles/int_text_style_extension.dart';

enum AppSnackBarType {
  common,
  error,
  success,
  warning,
}

class AppSnackBar {
  final String message;
  final AppSnackBarType type;

  AppSnackBar({
    required this.message,
    this.type = AppSnackBarType.common,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        titleText: Text(
          'Error',
          style: 14.0.bold,
        ),
        messageText: Text(
          message,
          style: 14.0.regular,
        ),
        borderRadius: 8.0,
        margin: const EdgeInsets.all(24.0),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}