import 'package:flutter/material.dart';

import '../config/app_colors.dart';

enum AppElevatedButtonVariant {
  primary,
  primaryVariant,
  secondary,
}

class AppElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final AppElevatedButtonVariant variant;

  const AppElevatedButton({
    super.key,
    this.onPressed,
    this.child,
    this.padding,
    this.contentPadding,
    this.variant = AppElevatedButtonVariant.primary,
  });

  const AppElevatedButton.primaryVariant({
    super.key,
    this.onPressed,
    this.child,
    this.padding,
    this.contentPadding,
    this.variant = AppElevatedButtonVariant.primaryVariant,
  });

  const AppElevatedButton.secondary({
    super.key,
    this.onPressed,
    this.child,
    this.padding,
    this.contentPadding,
    this.variant = AppElevatedButtonVariant.secondary,
  });

  @override
  Widget build(BuildContext context) {
    double paddingTop = contentPadding?.top ?? 0;
    double paddingBottom = contentPadding?.bottom ?? 0;
    return InkWell(
      onTap: onPressed,
      splashFactory: InkRipple.splashFactory,
      borderRadius: BorderRadius.circular(32),
      child: Ink(
        height: kMinInteractiveDimension + paddingTop + paddingBottom,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: getBackgroundColor(),
          gradient: variant == AppElevatedButtonVariant.primaryVariant
              ? getLinearBackgroundColor()
              : null,
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Align(
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }

  Color? getBackgroundColor() {
    switch (variant) {
      case AppElevatedButtonVariant.primary:
        return AppColors.primary;
      case AppElevatedButtonVariant.primaryVariant:
        return null;
      case AppElevatedButtonVariant.secondary:
        return AppColors.white;
    }
  }

  LinearGradient? getLinearBackgroundColor() {
    switch (variant) {
      case AppElevatedButtonVariant.primaryVariant:
        return AppColors.primaryVariantGradient;
      case AppElevatedButtonVariant.primary:
        return null;
      case AppElevatedButtonVariant.secondary:
        return null;
    }
  }
}
