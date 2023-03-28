import 'package:flutter/material.dart';
import 'package:writeapp/theme/colors.dart';
import 'package:writeapp/theme_manager.dart';

class NotesTabBar extends StatelessWidget {
  const NotesTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414,
      height: 70,
      color: themeManager.themeMode == ThemeMode.dark
          ? WriteColors.accent.shade50
          : WriteColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.logout_outlined,),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.mic_none_rounded),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit_note_rounded),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
