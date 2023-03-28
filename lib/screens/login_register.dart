import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:writeapp/fireauth/auth.dart';


class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> register() async {
    try {
      await Auth().signIn(email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> login() async {
    try {
      await Auth().signUp(email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return Text('Firebase auth');
  }

  Widget _textField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
        onPressed: isLogin ? login : register,
        child: Text(isLogin ? 'Login' : 'Register'));
  }

  Widget _authButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(isLogin ? 'Register instead' : 'Login instead'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _textField('email', email),
            _textField('password', password),
            _errorMessage(),
            _submitButton(),
            _authButton()
          ],

        ),
      ),
    );
  }
}
