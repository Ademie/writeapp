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
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: WriteColors.primary.shade300,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: WriteColors.accent,
  colorScheme: ColorScheme.dark(primary: WriteColors.primary),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: WriteColors.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: WriteColors.accent.shade100,
    // Color.fromARGB(255, 75, 75, 74),
  ),
);
