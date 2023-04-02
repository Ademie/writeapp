import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:writeapp/components/noteswidgets/controls.dart';

class ControlsPanel extends StatelessWidget {
  const ControlsPanel({
    super.key, required this.children,
  });

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Controls(
            icon: FontAwesomeIcons.arrowLeft,
            action: () => Navigator.pop(context),
          ),
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
