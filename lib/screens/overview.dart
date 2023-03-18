import 'package:flutter/material.dart';
import 'package:writeapp/screens/overviewwidgets/bottom_bar.dart';
import 'package:writeapp/screens/overviewwidgets/search_bar.dart';
import 'package:writeapp/screens/overviewwidgets/tab_controller.dart';
import 'package:writeapp/screens/overviewwidgets/top_bar.dart';
import 'package:writeapp/theme/colors.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    final double mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBar(),
            SizedBox(
              height: mediaHeight - 250,
              child: ListView(
                children: [
                  SearchBar(),
                  DefaultTabController(
                    length: 2,
                    child: TabControllerChild(),
                  ),
                ],
              ),
            ),
            // BottomBar()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'First',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            label: 'Second',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Thired',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
