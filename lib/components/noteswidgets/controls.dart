import 'package:flutter/material.dart';
import 'package:writeapp/theme/colors.dart';
import 'package:writeapp/theme_manager.dart';

class Controls extends StatelessWidget {
  const Controls({
    super.key,
    this.icon,
    this.action,
  });

  final IconData? icon;
  final Function? action;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 1.5,
              color: themeManager.themeMode == ThemeMode.dark
                  ? Colors.white
                  : WriteColors.accent,
            )),
        child: Center(
          child: IconButton(
            icon: Icon(
              icon,
              size: 28,
              color: themeManager.themeMode == ThemeMode.dark
                  ? Colors.white
                  : WriteColors.accent,
            ),
            onPressed: () => action,
          ),
        ));
  }
}
