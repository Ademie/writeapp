import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:writeapp/components/noteswidgets/character_count.dart';
import 'package:writeapp/components/noteswidgets/modal_action_tile.dart';
import 'package:writeapp/screens/overview.dart';

class ShowModal extends StatelessWidget {
  const ShowModal({
    super.key,
    required this.editingNote,
  });
  final DocumentSnapshot editingNote;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ModalActionTile(
                action: () {
                  editingNote.reference.delete().whenComplete(() =>
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Overview();
                      })));
                },
                label: "Delete",
                icon: Icons.delete_outline_rounded,
              ),
              ModalActionTile(
                action: () {
                  
                },
                label: "Duplicate",
                icon: Icons.copy_rounded,
              ),
              ModalActionTile(
                action: () {},
                label: "Share",
                icon: Icons.share,
              ),
              ModalActionTile(
                action: () {},
                label: "Label",
                icon: Icons.label,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.mic),
                onPressed: () {},
              ),
              CharacterCount(),
              IconButton(
                icon: Icon(Icons.cancel_outlined),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
