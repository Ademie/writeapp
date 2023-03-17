import 'package:flutter/material.dart';
import 'package:writeapp/screens/overviewwidgets/search_bar.dart';
import 'package:writeapp/screens/overviewwidgets/tab_contents.dart';
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
    return Center(
      child: SizedBox(
        height: mediaHeight,
        width: 414,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          body: Column(
            children: [
              TopBar(),
              SizedBox(
                height: mediaHeight - 50,
                child: ListView(
                  children: [
                    SearchBar(),
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                            indicatorColor: WriteColors.primary,
                            unselectedLabelStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            labelStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
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
                              height: MediaQuery.of(context).size.height * 0.8,
                              padding: EdgeInsets.only(bottom: 100),
                              child: TabBarView(children: [
                                TabContents(),
                                TabContents(),
                              ]))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
