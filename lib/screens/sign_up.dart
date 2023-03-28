import 'package:flutter/material.dart';
import 'package:writeapp/fireauth/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:writeapp/screens/overview.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

late int tabIndex = 0;

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 414,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
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
                Expanded(
                  child: TabBarView(children: [
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: email,
                              decoration: InputDecoration(
                                  hintText: 'example@gmail.com',
                                  prefixIcon: Icon(Icons.mail_outline)),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: password,
                            decoration: InputDecoration(
                                hintText: 'password',
                                prefixIcon: Icon(Icons.lock_outline)),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Auth().signIn(
                                  email: email.text, password: password.text);
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Overview();
                              }));
                            },
                            child: Text('Sign Up'))
                      ],
                    ),
                    Container(
                      child: Text('Hello'),
                    )
                  ]),
                )
              ],
            ),
          ),
          resizeToAvoidBottomInset: true,
          // bottomSheet: tabIndex == 1 ? _button() : null,
        ),
      ),
    );
  }
}
