import 'package:flutter/material.dart';

String _fontFamily = 'Manrope';

class AppTextStyles {
  static TextStyle get extraLight => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w200,
      );

  static TextStyle get light => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w300,
      );

  static TextStyle get regular => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get medium => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get semiBold => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get bold => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get extraBold => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w800,
      );
}