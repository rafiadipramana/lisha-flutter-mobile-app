import 'package:flutter/material.dart';
import '../extensions/text_styles/int_text_style_extension.dart';
import '../config/app_colors.dart';

class AppUnderlinedTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextStyle? style;
  final bool? obscureText;
  final String labelText;
  final TextInputAction? textInputAction;
  final String?Function(String?)? validator;

  const AppUnderlinedTextFormField({
    super.key,
    required this.controller,
    this.style,
    this.obscureText,
    required this.labelText,
    this.textInputAction,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    /// Set default value if style is null
    final TextStyle style = this.style ?? 16.0.regular;
    return Theme(
      data: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.white.withOpacity(0.8),
          selectionColor: AppColors.white.withOpacity(0.8),
          selectionHandleColor: AppColors.white.withOpacity(0.8),
        ),
      ),
      child: TextFormField(
        obscureText: obscureText ?? false,
        style: style.copyWith(
          color: AppColors.white,
        ),
        controller: controller,
        textInputAction: textInputAction ?? TextInputAction.next,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: 16.0.regular.copyWith(
            color: AppColors.white.withOpacity(0.8),
          ),
          border: const UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.white.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }
}
