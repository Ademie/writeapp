import 'package:flutter/material.dart';
import 'package:writeapp/fireauth/auth.dart';
import 'package:writeapp/screens/login_register.dart';
import 'package:writeapp/screens/overview.dart';

class AuthChanges extends StatefulWidget {
  const AuthChanges({super.key});

  @override
  State<AuthChanges> createState() => _AuthChangesState();
}

class _AuthChangesState extends State<AuthChanges> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Overview();
        } else {
          return LoginRegister();
        }
      },
    );
  }
}
