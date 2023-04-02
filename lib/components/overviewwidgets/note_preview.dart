import 'package:flutter/material.dart';
import 'package:writeapp/screens/edit_note.dart';
import 'package:writeapp/theme/colors.dart';

class NotePreview extends StatelessWidget {
  const NotePreview({
    super.key,
    required this.index,
    this.snapshot,
  });
  final int index;
  final snapshot;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditNote(
                      editingNote: snapshot.data.docs[index],
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:  WriteColors.accent.shade200
            ),
            // color:
            //     index == 0 ? WriteColors.primary : WriteColors.accent.shade200),
        child: ListView(
          children: [
            Text(
              snapshot.data!.docs[index]['title'],
              style: TextStyle(height: 1.8, fontWeight: FontWeight.w800),
            ),
            SingleChildScrollView(
              child: Text(
                snapshot.data!.docs[index]['content'],
                overflow: TextOverflow.ellipsis,
                maxLines: index.isEven ? 8 : 5,
                style: TextStyle(height: 1.8, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
