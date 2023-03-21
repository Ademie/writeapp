import 'package:flutter/material.dart';
import 'package:writeapp/theme/colors.dart';
import 'package:writeapp/theme_manager.dart';

class TabFolders extends StatelessWidget {
  const TabFolders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 600,
        padding: EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: WriteColors.primary),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.notes_outlined, size: 40),
                  Text('My Notes'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: WriteColors.accent.shade200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.brush_outlined, size: 40),
                  Text('Design'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: WriteColors.accent.shade200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.notes_outlined, size: 40),
                  Text('Projects'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: WriteColors.accent.shade200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.check, size: 40),
                  Text('To do list'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: 414,
        height: 70,
        color: themeManager.themeMode == ThemeMode.dark
            ? WriteColors.accent.shade50
            : WriteColors.primary,
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 200,
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
                ))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
