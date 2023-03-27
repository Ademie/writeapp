import 'package:firebase_auth/firebase_auth.dart';
import 'package:writeapp/components/overviewwidgets/folders_tab.dart';
import 'package:writeapp/components/overviewwidgets/notes_tab.dart';
import 'package:writeapp/components/overviewwidgets/notes_tab_bar.dart';
import 'package:writeapp/fireauth/auth.dart';
import 'package:flutter/material.dart';
import 'package:writeapp/components/overviewwidgets/search_bar.dart';
import 'package:writeapp/components/overviewwidgets/top_bar.dart';
import 'package:writeapp/screens/addnotes.dart';
import 'package:writeapp/theme/colors.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

final User? user = Auth().currentUser;

Future<void> signOut() async {
  await Auth().signOut();
}

Widget _title() {
  return Text('Firebase Auth');
}

Widget _userUid() {
  return Text(user?.email ?? 'User email');
}

Widget _signOutButton() {
  return ElevatedButton(onPressed: signOut, child: Text('Sign Out'));
}

late int _tabIndex = 0;

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
                // child: TabControllerChild(),
                child: Column(
                  children: [
                    TabBar(
                      onTap: (value) {
                        setState(() {
                          _tabIndex = value;
                        });
                      },
                      indicatorColor: WriteColors.primary,
                      unselectedLabelStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      labelStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
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
                      constraints:
                          BoxConstraints(minHeight: 600, maxHeight: 700),
                      child: TabBarView(children: [
                        NotesTab(),
                        FoldersTab()

                        
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // bottomSheet: BottomBar(),
          bottomSheet: _tabIndex == 0 ? NotesTabBar() : Text('fuck you'),
          floatingActionButton: _tabIndex == 0 ? SizedBox(
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
          ):null,
        ),
      ),
    );
  }
}
