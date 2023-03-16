import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:writeapp/theme/colors.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: WriteColors.primary,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: generateMaterialColor(
        color: WriteColors.accent,
      ),
    ));

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: WriteColors.dark,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: WriteColors.accent,
  ),
);


