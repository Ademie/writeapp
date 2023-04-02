import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:writeapp/fireauth/auth_changes.dart';
import 'package:writeapp/theme/colors.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/writeapp.png'),
      logoWidth: 150,
      title: Text(
        "WriteApp",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: WriteColors.primary,
      showLoader: false,
      navigator: AuthChanges(),
      durationInSeconds: 3,
    );
  }
}
