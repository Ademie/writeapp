import 'package:flutter/material.dart';

class WriteColors {
  static const MaterialColor primary =
      MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFF858585),
    100: Color(0XFF5C5C5C),
    200: Color(0XFF1F1F1F),
    300: Color(0XFF141414),
    400: Color(0XFF0A0A0A),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFF00418D),
    700: Color(0xFF003882),
    800: Color(0xFF003078),
    900: Color(0xFF002167),
  });
  static const _primaryPrimaryValue = 0XFF000000;

  static const MaterialAccentColor accent =
      MaterialAccentColor(_accentPrimaryValue, <int, Color>{
    50: Color(0xFFFFCF99),
    100: Color(0XFFFFC685),
    200: Color(0XFFFFBC70),
    300: Color(0XFFFFB35C),
    400: Color(0xFFFFA947),
    500: Color(_accentPrimaryValue),
    600: Color(0xFF00418D),
    700: Color(0xFF003882),
    800: Color(0xFF003078),
    900: Color(0xFF002167),
  });
  static const _accentPrimaryValue = 0XFFFFA132;
}
