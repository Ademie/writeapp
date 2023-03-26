import 'package:flutter/material.dart';
import 'package:writeapp/components/overviewwidgets/bottom_bar.dart';
import 'package:writeapp/components/overviewwidgets/search_bar.dart';
import 'package:writeapp/components/overviewwidgets/tab_controller.dart';
import 'package:writeapp/components/overviewwidgets/top_bar.dart';
import 'package:writeapp/screens/addnotes.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 414,
        child: Scaffold(
          body: ListView(
            children: [
              TopBar(),
              SearchBar(),
              DefaultTabController(
                length: 2,
                child: TabControllerChild(),
              ),
            ],
          ),
          bottomSheet: BottomBar(),
          floatingActionButton: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddNotes()));
              },
              child: Icon(
                Icons.add,
                size: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
