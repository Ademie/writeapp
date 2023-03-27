import 'package:flutter/material.dart';
import 'package:writeapp/theme/colors.dart';
import 'package:writeapp/theme_manager.dart';

class FoldersTabBar extends StatelessWidget {
  const FoldersTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeManager.themeMode == ThemeMode.dark
          ? WriteColors.accent
          : WriteColors.primary.shade100,
      height: 100,
      width: 414,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: 414,
              height: 60,
              color: themeManager.themeMode == ThemeMode.dark
                  ? WriteColors.accent.shade50
                  : WriteColors.primary,
            ),
          ),
          Positioned(
            left: 50,
            right: 50,
            bottom: 35,
            child: SizedBox(
              width: 300,
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                  color: themeManager.themeMode == ThemeMode.dark
                      ? WriteColors.primary
                      : WriteColors.accent.shade50,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add, color: Colors.white),
                  label: Text(
                    'Add New Folder',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
