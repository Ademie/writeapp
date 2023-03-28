import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:writeapp/screens/overview.dart';
import 'package:writeapp/screens/sign_up.dart';
import 'package:writeapp/theme/constants.dart';
import 'package:writeapp/theme_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return Overview();
      },
      routes: <RouteBase>[
        GoRoute(
            path: 'signup',
            builder: (context, state) {
              return SignUp();
            })
      ])
]);

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
      home: Overview(),
    );
  }
}
