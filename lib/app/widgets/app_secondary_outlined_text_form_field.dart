import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../extensions/text_styles/int_text_style_extension.dart';

class AppSecondaryOutlinedTextFormField extends StatelessWidget {
  const AppSecondaryOutlinedTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.white.withOpacity(0.8),
          selectionColor: AppColors.white.withOpacity(0.8),
          selectionHandleColor: AppColors.white.withOpacity(0.8),
        ),
      ),
      child: TextFormField(
        controller: controller,
        style: 16.0.regular.copyWith(
              color: AppColors.white,
            ),
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: 16.0.regular.copyWith(
                color: AppColors.grey300,
              ),
          errorStyle: 12.0.regular.copyWith(
                color: Colors.red
              ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 11,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.white.withOpacity(0.06),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.white.withOpacity(0.06),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.white.withOpacity(0.06),
            ),
          ),
          filled: true,
          fillColor: AppColors.tertiary.withOpacity(0.05),
        ),
      ),
    );
  }
}
