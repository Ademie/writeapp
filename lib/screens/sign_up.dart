import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

late int tabIndex = 0;

Widget _button() {
  return ElevatedButton(onPressed: () {}, child: Text('Yo'));
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 414,
        child: Scaffold(
          appBar: AppBar(),
          body: DefaultTabController(
            length: 2,
            child: TabBar(
              tabs: [
                Tab(text: 'Sign Up'),
                Tab(
                  text: 'Sign In',
                )
              ],
              onTap: (value) {
                setState(() {
                  tabIndex = value;
                });
              },
            ),
          ),
          bottomSheet: tabIndex == 1 ? _button() : null,
        ),
      ),
    );
  }
}
