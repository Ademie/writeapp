import 'package:flutter/material.dart';
import 'package:writeapp/screens/overviewwidgets/search_bar.dart';
import 'package:writeapp/screens/overviewwidgets/top_bar.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TopBar(),
            Expanded(
              child: ListView(
                children: [
                  SearchBar(),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
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
                            height: 400,
                            child: TabBarView(
                                children: [Text('Tab 1'), Text('Tab 2')]))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
