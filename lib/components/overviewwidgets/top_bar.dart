import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:writeapp/fireauth/auth.dart';
import 'package:writeapp/screens/login_register.dart';
import 'package:writeapp/theme/colors.dart';
import 'package:writeapp/theme_manager.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: WriteColors.primary,
            onPressed: () {
              Auth().signOut().whenComplete(() =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginRegister();
                  })));
            },
            icon: Icon(FontAwesomeIcons.rightFromBracket),
          ),
          Transform.scale(
            scale: 1.5,
            child: Switch(
                thumbColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return WriteColors.primary;
                  } else {
                    return Colors.black;
                  }
                }),
                thumbIcon: MaterialStateProperty.resolveWith<Icon?>((states) {
                  if (states.contains(MaterialState.selected)) {
                    return Icon(
                      FontAwesomeIcons.sun,
                      color: Colors.white,
                    );
                  } else {
                    return Icon(
                      FontAwesomeIcons.moon,
                      color: Colors.white,
                    );
                  }
                }),
                trackColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return WriteColors.primary;
                  } else {
                    return Colors.grey;
                  }
                }),
                value: themeManager.themeMode == ThemeMode.dark,
                onChanged: (newValue) {
                  themeManager.toggleTheme(newValue);
                }),
          )
        ],
      ),
    );
  }
}
