import 'package:flutter/material.dart';
import 'package:writeapp/components/noteswidgets/controls.dart';

class ControlsPanel extends StatelessWidget {
  const ControlsPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
