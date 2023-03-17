import 'package:flutter/material.dart';
import 'package:writeapp/screens/overviewwidgets/search_bar.dart';
import 'package:writeapp/screens/overviewwidgets/tab_controller.dart';
import 'package:writeapp/screens/overviewwidgets/top_bar.dart';



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

