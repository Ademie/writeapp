import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:writeapp/components/noteswidgets/controls_panel.dart';
import 'package:writeapp/components/noteswidgets/notes_title.dart';
import 'package:writeapp/fireauth/auth.dart';
import 'package:writeapp/theme/colors.dart';
import 'package:writeapp/theme_manager.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  List<String> _history = [];
  int _historyIndex = 0;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  String uid = Auth().currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('notes');
    return Center(
        child: Container(
            width: 414,
            padding: EdgeInsets.only(
              bottom: 0,
            ),
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
              ),
              body: ListView(
                children: [
                  ControlsPanel(
                    children: [
                      IconButton(
                        onPressed: () {
                          canUndo() ? undo() : null;
                        },
                        icon: Icon(
                          FontAwesomeIcons.arrowRotateLeft
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          canRedo() ? redo() : null;
                        },
                        icon: Icon(
                          FontAwesomeIcons.arrowRotateRight
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ref.add({
                            'title': _titleController.text,
                            'content': _contentController.text
                          }).whenComplete(() => Navigator.pop(context));
                        },
                        icon: Icon(
                          FontAwesomeIcons.circleCheck
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NotesTitle(titleController: _titleController),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            child: TextFormField(
                              controller: _contentController,
                              onChanged: (value) {
                                addToHistory(value);
                              },
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: null,
                              style: TextStyle(
                                  fontSize: 18,
                                  color:
                                      themeManager.themeMode == ThemeMode.dark
                                          ? Colors.white
                                          : WriteColors.accent),
                              decoration: InputDecoration(
                                hintText: "Text here...",
                                border: InputBorder.none,
                                filled: false,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  bool canUndo() {
    return _historyIndex > 0;
  }

  bool canRedo() {
    return _historyIndex < _history.length - 1;
  }

  void addToHistory(String text) {
    if (_historyIndex < _history.length - 1) {
      _history.removeRange(_historyIndex + 1, _history.length);
    }
    _history.add(text);
    _historyIndex = _history.length - 1;
  }

  void undo() {
    setState(() {
      _historyIndex--;
      _contentController.text = _history[_historyIndex];
    });
  }

  void redo() {
    setState(() {
      _historyIndex++;
      _contentController.text = _history[_historyIndex];
    });
  }
}
