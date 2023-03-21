import 'package:flutter/material.dart';
import 'package:writeapp/screens/addnotes.dart';
import 'package:writeapp/screens/overview.dart';
import 'package:writeapp/screens/test.dart';
import 'package:writeapp/theme/constants.dart';
import 'package:writeapp/theme_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}


class MyAppState extends State<MyApp> {
  @override
  void dispose() {
    themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      // home: Overview(),
      home: AddNotes(),
      // home: TextEditorPage(),
    );
  }
}

