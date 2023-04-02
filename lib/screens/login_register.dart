import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:writeapp/fireauth/auth.dart';
import 'package:writeapp/theme/colors.dart';

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

  CollectionReference ref = FirebaseFirestore.instance.collection('profile');

  Future<void> register() async {
    try {
      await Auth().signUp(email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> login() async {
    try {
      await Auth().signIn(email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _logo() {
    return SizedBox(
      height: 100,
      width: 100,
      child: Transform.rotate(
        // angle: 90 * 3.14 / 180,
        angle: 0,
        child: Image.asset('assets/writeapp.png'),
      ),
    );
  }

  Widget _welcomeText() {
    return SizedBox(
      child: Text("We're glad to have you!"),
    );
  }

  Widget _textField(
    String title,
    IconData icon,
    bool obscureText,
    TextEditingController controller,
  ) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            fillColor: Colors.transparent,
            labelText: title,
            prefixIcon: Icon(icon),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: WriteColors.primary,
                ))),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(side: BorderSide.none),
          minimumSize: Size(340, 50),
        ),
        onPressed: isLogin ? login : register,
        child: Text(isLogin ? 'Login' : 'Register'));
  }

  Widget _authButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextButton(
          onPressed: () {
            setState(() {
              isLogin = !isLogin;
            });
          },
          child: Text(isLogin
              ? 'Don\'t have an Account?'
              : 'Already have an Account?')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _logo(),
            _welcomeText(),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.grey.shade200)),
              child: Column(
                children: [
                  _textField('email', Icons.mail_outline_rounded, false, email),
                  _textField(
                      'password', Icons.lock_outline_rounded, true, password),
                  _errorMessage(),
                  _submitButton(),
                  _authButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
