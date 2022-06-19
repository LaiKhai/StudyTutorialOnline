import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/LoginPage/AD_LoginForm.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            child: Image.asset(
              "assets/images/admin_login.png",
              width: 200,
              height: 200,
            ),
          )
        ],
      )),
    );
  }
}
