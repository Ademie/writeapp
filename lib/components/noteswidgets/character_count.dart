import 'package:flutter/material.dart';
import 'package:writeapp/theme/colors.dart';
import 'package:writeapp/theme_manager.dart';

class CharacterCount extends StatelessWidget {
  const CharacterCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 200,
      child: TextFormField(
        style: TextStyle(
            fontSize: 14,
            color: themeManager.themeMode == ThemeMode.dark
                ? Colors.white
                : WriteColors.accent),
        decoration: InputDecoration(
          hintText: 'Sat, 12:05 | 2.451 Characters',
          border: InputBorder.none,
          filled: false,
        ),
      ),
    );
  }
}

