import 'package:flutter/material.dart';
import 'package:writeapp/components/noteswidgets/controls.dart';
import 'package:writeapp/components/noteswidgets/controls_panel.dart';
import 'package:writeapp/components/noteswidgets/notes_title.dart';
import 'package:writeapp/components/noteswidgets/show_modal.dart';
import 'package:writeapp/theme/colors.dart';
import 'package:writeapp/theme_manager.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  TextEditingController _editingController = TextEditingController();
  List<String> _history = [];
  int _historyIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double mediaHeight = MediaQuery.of(context).size.height;
    return Center(
        child: Container(
            width: 414,
            height: mediaHeight,
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
                      Controls(
                        icon: Icons.settings_backup_restore_outlined,
                        action: canUndo() ? undo : null,
                      ),
                      Controls(
                        icon: Icons.refresh_outlined,
                        action: canRedo() ? redo : null,
                      ),
                      Controls(
                        icon: Icons.check,
                        action: () {},
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: mediaHeight - 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NotesTitle(),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            child: TextFormField(
                              controller: _editingController,
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
              floatingActionButton: SizedBox(
                height: 70,
                width: 70,
                child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        elevation: 0,
                        builder: (BuildContext index) {
                          return ShowModal();
                        });
                  },
                  child: Icon(
                    Icons.more,
                    size: 35,
                  ),
                ),
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
      _editingController.text = _history[_historyIndex];
    });
  }

  void redo() {
    setState(() {
      _historyIndex++;
      _editingController.text = _history[_historyIndex];
    });
  }
}

