import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:writeapp/theme/colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(color: WriteColors.primary.shade100),
  scaffoldBackgroundColor: WriteColors.primary.shade100,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: generateMaterialColor(
      color: WriteColors.primary,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: WriteColors.primary, foregroundColor: Colors.white),
  iconTheme: IconThemeData(color: WriteColors.accent, size: 35),
  // INPUT FIELD

  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: WriteColors.primary,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: WriteColors.accent.shade200
  ),
  // TABBAR
  tabBarTheme: TabBarTheme(
    labelColor: WriteColors.accent,
    indicatorSize: TabBarIndicatorSize.label,
  ),
  // TEXT
  textTheme: GoogleFonts.acmeTextTheme(),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(color: WriteColors.accent),
  scaffoldBackgroundColor: WriteColors.accent,
  colorScheme: ColorScheme.dark(primary: WriteColors.primary),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: WriteColors.primary, foregroundColor: Colors.white),
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
  // TABBAR
  tabBarTheme: TabBarTheme(
    indicatorSize: TabBarIndicatorSize.label,
  ),
  iconTheme: IconThemeData(color: Colors.white, size: 35),
  textTheme: GoogleFonts.acmeTextTheme().copyWith(
      bodyMedium:
          GoogleFonts.acme(color: Colors.white, fontWeight: FontWeight.w100)),
);
