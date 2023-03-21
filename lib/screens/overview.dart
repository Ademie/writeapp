import 'package:flutter/material.dart';
import 'package:writeapp/components/overviewwidgets/search_bar.dart';
import 'package:writeapp/components/overviewwidgets/tab_controller.dart';
import 'package:writeapp/components/overviewwidgets/top_bar.dart';

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
      child: Container(
        width: 414,
        height: mediaHeight,
        padding: EdgeInsets.only(
          bottom: 0,
          // top: 15,
        ),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: ListView(
            children: [
              TopBar(),
              SizedBox(
                child: Column(
                  children: [
                    SearchBar(),
                    DefaultTabController(
                      length: 2,
                      child: TabControllerChild(),
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
