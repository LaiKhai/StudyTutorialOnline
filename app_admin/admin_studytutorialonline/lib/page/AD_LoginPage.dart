import 'package:StudyTutorialOnlineAdmin/common/contrains/dimen.dart';
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
            child: Image.asset(
              "assets/images/admin_login.png",
              fit: BoxFit.cover,
              width: getWidthSize(context),
              height: 400,
            ),
          ),
          LoginForm()
        ],
      )),
    );
  }
}
