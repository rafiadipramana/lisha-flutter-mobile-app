import 'package:flutter/material.dart';

String _manropeFontFamily = 'Manrope';
String _lufgaFontFamily = 'Lufga';

class AppTextStyles {
  static TextStyle get extraLight => TextStyle(
        fontFamily: _manropeFontFamily,
        fontWeight: FontWeight.w200,
      );

  static TextStyle get light => TextStyle(
        fontFamily: _manropeFontFamily,
        fontWeight: FontWeight.w300,
      );

  static TextStyle get regular => TextStyle(
        fontFamily: _manropeFontFamily,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get medium => TextStyle(
        fontFamily: _manropeFontFamily,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get semiBold => TextStyle(
        fontFamily: _manropeFontFamily,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get bold => TextStyle(
        fontFamily: _manropeFontFamily,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get extraBold => TextStyle(
        fontFamily: _manropeFontFamily,
        fontWeight: FontWeight.w800,
      );
  
  static TextStyle get secondaryRegular => TextStyle(
        fontFamily: _lufgaFontFamily,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get secondarySemiBold => TextStyle(
        fontFamily: _lufgaFontFamily,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get secondaryBold => TextStyle(
        fontFamily: _lufgaFontFamily,
        fontWeight: FontWeight.w700,
      );
}