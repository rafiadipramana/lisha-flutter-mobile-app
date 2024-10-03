import 'package:flutter/material.dart';

class AppColors {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const black50 = Color(0xFF17181A);
  static const black100 = Color(0xFF111215);
  static const black200 = Color(0xFF191B21);
  static const grey = Color(0xFFA2A2A3);
  static const grey50 = Color(0xFF20232A);
  static const grey100 = Color(0xFF2E323B);
  static const grey200 = Color(0xFF758195);
  static const transparent = Color(0x00000000);

  static const primary = Color(0xFFD758D2);
  static const primaryVariant = Color(0xFFCA7793);
  static const secondary = Color(0xFFF3ECF0);
  static LinearGradient primaryGradient = LinearGradient(
        colors: [
          const Color(0xFFF1B6F0).withOpacity(0.5 * 0.2),
          primary.withOpacity(0.2),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
  static const LinearGradient primaryVariantGradient = LinearGradient(
    colors: [
      Color(0xFF89496B),
      Color(0xFFE187A1),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static LinearGradient primaryVariantGradientSemiTransperent = LinearGradient(
    colors: [
      const Color(0xFF89496B).withOpacity(0.08),
      const Color(0xFFE187A1).withOpacity(0.08),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient primaryVariantGradientWithOpacity({required double opacity}) => LinearGradient(
    colors: [
      const Color(0xFF89496B).withOpacity(opacity),
      const Color(0xFFE187A1).withOpacity(opacity),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
