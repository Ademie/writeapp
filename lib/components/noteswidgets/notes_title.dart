import 'package:flutter/material.dart';
import 'package:writeapp/theme/colors.dart';
import 'package:writeapp/theme_manager.dart';

class NotesTitle extends StatelessWidget {
  const NotesTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            style: TextStyle(
                fontSize: 27,
                color:
                    themeManager.themeMode == ThemeMode.dark
                        ? Colors.white
                        : WriteColors.accent),
            decoration: InputDecoration(
              hintText: 'Design Principles',
              border: InputBorder.none,
              filled: false,
            ),
          ),
          SizedBox(
            height: 20,
            child: TextFormField(
              style: TextStyle(
                  fontSize: 14,
                  color: themeManager.themeMode ==
                          ThemeMode.dark
                      ? Colors.white
                      : WriteColors.accent),
              decoration: InputDecoration(
                hintText: 'Sat, 12:05 | 2.451 Characters',
                border: InputBorder.none,
                filled: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
