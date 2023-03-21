import 'package:flutter/material.dart';
import 'package:writeapp/theme/colors.dart';
import 'package:writeapp/theme_manager.dart';


class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        style: TextStyle(
          color: themeManager.themeMode == ThemeMode.dark ?  Colors.white : WriteColors.accent
        ),
        decoration: InputDecoration(
          hintText: 'Search Your Notes',
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              Icons.search,
              size: 37,
            ),
          ),
        ),
      ),
    );
  }
}
