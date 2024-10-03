import 'package:flutter/material.dart';
import 'package:lisha/app/config/app_text_styles.dart';

extension IntTextStyleExtension on double {
  TextStyle get extraLight {
    return AppTextStyles.extraLight.copyWith(
      fontSize: this,
    );
  }

  TextStyle get light {
    return AppTextStyles.light.copyWith(
      fontSize: this,
    );
  }

  TextStyle get regular {
    return AppTextStyles.regular.copyWith(
      fontSize: this,
    );
  }

  TextStyle get medium {
    return AppTextStyles.medium.copyWith(
      fontSize: this,
    );
  }

  TextStyle get semiBold {
    return AppTextStyles.semiBold.copyWith(
      fontSize: this,
    );
  }

  TextStyle get bold {
    return AppTextStyles.bold.copyWith(
      fontSize: this,
    );
  }

  TextStyle get extraBold {
    return AppTextStyles.extraBold.copyWith(
      fontSize: this,
    );
  }
}
