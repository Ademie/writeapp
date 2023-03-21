import 'package:flutter/material.dart';
import 'package:writeapp/components/noteswidgets/controls_panel.dart';
import 'package:writeapp/theme/colors.dart';
import 'package:writeapp/theme_manager.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
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
                automaticallyImplyLeading: false,
              ),
              body: ListView(
                children: [
                  ControlsPanel(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: mediaHeight - 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextFormField(
                                style: TextStyle(
                                    fontSize: 27,
                                    color:
                                        themeManager.themeMode == ThemeMode.dark
                                            ? Colors.white
                                            : WriteColors.accent),
                                decoration: InputDecoration(
                                  hintText: 'Design Principles',
                                  border: InputBorder.none,
                                  filled: false,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: TextFormField(
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeManager.themeMode ==
                                              ThemeMode.dark
                                          ? Colors.white
                                          : WriteColors.accent),
                                  decoration: InputDecoration(
                                    hintText: 'Sat, 12:05 | 2.451 Characters',
                                    border: InputBorder.none,
                                    filled: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: null,
                            style: TextStyle(
                                fontSize: 18,
                                color: themeManager.themeMode == ThemeMode.dark
                                    ? Colors.white
                                    : WriteColors.accent),
                            decoration: InputDecoration(
                              hintText: "Text here...",
                              border: InputBorder.none,
                              filled: false,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
