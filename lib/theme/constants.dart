import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:writeapp/theme/colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: WriteColors.primary.shade100,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: generateMaterialColor(
      color: WriteColors.primary,
    ),
  ),
  // INPUT FIELD
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: WriteColors.accent,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: WriteColors.primary.shade300,
  ),
  // TABBAR
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: WriteColors.accent,
  colorScheme: ColorScheme.dark(primary: WriteColors.primary),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: WriteColors.primary,
  ),
  // INPUT FIELD
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: WriteColors.primary,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: WriteColors.accent.shade100,
  ),
);
