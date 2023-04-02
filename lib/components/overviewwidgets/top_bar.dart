import 'package:flutter/material.dart';
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
            icon: Icon(
              Icons.logout_outlined,
            ),
          ),
          Switch.adaptive(
              value: themeManager.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                themeManager.toggleTheme(newValue);
              })
        ],
      ),
    );
  }
}
