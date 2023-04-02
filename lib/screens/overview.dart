import 'package:firebase_auth/firebase_auth.dart';
import 'package:writeapp/components/overviewwidgets/notes_tab.dart';
import 'package:writeapp/fireauth/auth.dart';
import 'package:flutter/material.dart';
import 'package:writeapp/components/overviewwidgets/search_bar.dart';
import 'package:writeapp/components/overviewwidgets/top_bar.dart';
import 'package:writeapp/screens/add_note.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

final User? user = Auth().currentUser;

Future<void> signOut() async {
  await Auth().signOut();
}

int _tabIndex = 0;

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 414,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: ListView(
            children: [
              TopBar(),
              SearchBar(),
              Container(
                constraints: BoxConstraints(minHeight: 1000, maxHeight: 1100),
                child: NotesTab(),
              ),
              // DefaultTabController(
              //   length: 2,
              //   child: Column(
              //     children: [
              //       TabBar(
              //         onTap: (value) {
              //           setState(() {
              //             _tabIndex = value;
              //           });
              //         },
              //         indicatorColor: WriteColors.primary,
              //         unselectedLabelStyle:
              //             TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              //         labelStyle:
              //             TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              //         tabs: [
              //           Tab(
              //             text: 'All Notes',
              //           ),
              //           Tab(
              //             text: 'Folders',
              //           )
              //         ],
              //       ),
              //       Container(
              //         constraints:
              //             BoxConstraints(minHeight: 600, maxHeight: 700),
              //         child: TabBarView(children: [NotesTab(), FoldersTab()]),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
          // bottomSheet: _tabIndex == 0 ? NotesTabBar() : FoldersTabBar(),
          floatingActionButton: _tabIndex == 0
              ? SizedBox(
                  height: 70,
                  width: 70,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddNotes()));
                    },
                    child: Icon(
                      FontAwesomeIcons.plus,
                      size: 35,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
