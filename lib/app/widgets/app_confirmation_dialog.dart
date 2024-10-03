import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../config/app_colors.dart';
import '../extensions/text_styles/int_text_style_extension.dart';
import 'package:styled_divider/styled_divider.dart';

class AppConfirmationDialog extends StatelessWidget {
  const AppConfirmationDialog({
    super.key,
    required this.confirmationMessage,
    required this.confirmButtonText,
    required this.cancelButtonText,
    this.onConfirm,
    this.onCancel,
  });

  final String confirmationMessage;
  final String confirmButtonText;
  final String cancelButtonText;
  final Function()? onConfirm;
  final Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: AppColors.transparent,
      child: Ink(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: AppColors.primaryVariantGradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              confirmationMessage,
              style: 20.0.semiBold,
              textAlign: TextAlign.center,
            ),
            const Gap(16),
            InkWell(
              onTap: onConfirm,
              borderRadius: BorderRadius.circular(8),
              child: Ink(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 9,
                ),
                child: Text(
                  confirmButtonText,
                  style: 16.0.medium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            StyledDivider(
              color: AppColors.white.withOpacity(0.2),
              height: 0,
              lineStyle: DividerLineStyle.dashed,
            ),
            const Gap(16),
            InkWell(
              onTap: onCancel,
              borderRadius: BorderRadius.circular(8),
              child: Ink(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 9,
                ),
                child: Text(
                  cancelButtonText,
                  style: 16.0.medium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            StyledDivider(
              color: AppColors.white.withOpacity(0.2),
              height: 0,
              lineStyle: DividerLineStyle.dashed,
            ),
          ],
        ),
      ),
    );
  }
}
