import 'package:flutter/material.dart';

class WriteColors {
  

  static const MaterialColor primary =
      MaterialColor(_primaryValue, <int, Color>{
    50: Color.fromRGBO(255, 159, 50, .1),
    100: Color.fromRGBO(255, 213, 164, 1),
    200: Color.fromRGBO(255, 159, 50, .3),
    300: Color.fromRGBO(255, 159, 50, .4),
    400: Color.fromRGBO(255, 159, 50, .5),
    500: Color(_primaryValue),
    600: Color.fromRGBO(255, 159, 50, .6),
    700: Color.fromRGBO(255, 159, 50, .7),
    800: Color.fromRGBO(255, 159, 50, .8),
    900: Color.fromRGBO(255, 159, 50, .9),
  });
  static const int _primaryValue = 0XFFFFA132;

  static const MaterialColor accent = MaterialColor(_accentValue, <int, Color>{
    50: Color.fromRGBO(75, 75, 74, 1),
    100: Color.fromRGBO(158, 158, 158, .2),
    200: Color.fromRGBO(158, 158, 158, .3),
    300: Color.fromRGBO(158, 158, 158, .4),
    400: Color.fromRGBO(158, 158, 158, .5),
    500: Color(_accentValue),
    600: Color.fromRGBO(158, 158, 158, .6),
    700: Color.fromRGBO(158, 158, 158, .7),
    800: Color.fromRGBO(158, 158, 158, .8),
    900: Color.fromRGBO(158, 158, 158, .9),
  });
  static const int _accentValue = 0XFF0A0A0A;
}
