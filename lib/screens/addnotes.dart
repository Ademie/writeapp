import 'package:flutter/material.dart';
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
              top: 15,
            ),
            child: Scaffold(
              body: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Controls(
                          icon: Icons.arrow_back_ios_new,
                          action: () {},
                        ),
                        SizedBox(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Controls(
                                icon: Icons.settings_backup_restore_outlined,
                                action: () {},
                              ),
                              Controls(
                                icon: Icons.refresh_outlined,
                                action: () {},
                              ),
                              Controls(
                                icon: Icons.check,
                                action: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}

class Controls extends StatelessWidget {
  const Controls({
    super.key,
    this.icon,
    this.action,
  });

  final IconData? icon;
  final Function? action;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 1.5,
              color: themeManager.themeMode == ThemeMode.dark
                  ? Colors.white
                  : WriteColors.accent,
            )),
        child: Center(
          child: IconButton(
            icon: Icon(
              icon,
              size: 28,
              color: themeManager.themeMode == ThemeMode.dark
                  ? Colors.white
                  : WriteColors.accent,
            ),
            onPressed: () => action,
          ),
        ));
  }
}