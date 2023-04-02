import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:writeapp/components/overviewwidgets/note_preview.dart';


class NotesTab extends StatefulWidget {
  const NotesTab({
    super.key,
  });

  @override
  State<NotesTab> createState() => _NotesTabState();
}

class _NotesTabState extends State<NotesTab> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final ref = db.collection('notes');

    return Scaffold(
      body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return Container(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 150),
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (ScrollNotification is ScrollNotification) {
                    print('object scrolled');
                  }
                  return true;
                },
                child: StaggeredGridView.countBuilder(
                  staggeredTileBuilder: (index) =>
                      StaggeredTile.count(2, index.isEven ? 3 : 2.5),
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  crossAxisCount: 4,
                  itemCount: snapshot.hasData ? snapshot.data!.docs.length : 0,
                  itemBuilder: (context, index) => NotePreview(
                    index: index,
                    snapshot: snapshot,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
