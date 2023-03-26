import 'package:flutter/material.dart';
import 'package:writeapp/components/overviewwidgets/tab_folders.dart';
import 'package:writeapp/components/overviewwidgets/tab_notes.dart';
import 'package:writeapp/theme/colors.dart';

class TabControllerChild extends StatefulWidget {
  const TabControllerChild({
    super.key,
  });

  @override
  State<TabControllerChild> createState() => _TabControllerChildState();
}

class _TabControllerChildState extends State<TabControllerChild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorColor: WriteColors.primary,
          unselectedLabelStyle:
              TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          tabs: [
            Tab(
              text: 'All Notes',
            ),
            Tab(
              text: 'Folders',
            )
          ],
        ),
        Container(
          constraints: BoxConstraints(minHeight: 600, maxHeight: 700),
          child: TabBarView(children: [
            TabNotes(),
            TabFolders(),
          ]),
        ),
        
      ],
    );
  }
}
