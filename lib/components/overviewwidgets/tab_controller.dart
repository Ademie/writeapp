import 'package:flutter/material.dart';
import 'package:writeapp/components/overviewwidgets/tab_folders.dart';
import 'package:writeapp/components/overviewwidgets/tab_notes.dart';
import 'package:writeapp/theme/colors.dart';

class TabControllerChild extends StatelessWidget {
  const TabControllerChild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
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
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.3),
              child: TabBarView(children: [
                TabNotes(),
                TabFolders(),
              ]))
        ],
      );
    });
  }
}