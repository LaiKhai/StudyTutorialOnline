import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/dimen.dart';
import 'package:admin_studytutorialonline/page/AD_HomePage.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  void showToast() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: getWidthSize(context),
              height: 60,
              margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromRGBO(245, 132, 107, 0.4)),
              //height: 56,
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  cursorColor: AppColor.theme,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFFC56464),
                        //size: 25,
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Color(0xFFC56464),
                        fontSize: 18,
                      )),
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          Container(
              width: getWidthSize(context),
              height: 60,
              margin: EdgeInsets.fromLTRB(40, 0, 40, 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromRGBO(245, 132, 107, 0.4)),
              //height: 56,
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  cursorColor: AppColor.theme,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: _obscureText,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColor.theme_iconlogin,
                        ),
                        onPressed: () {
                          setState(() {
                            showToast();
                          });
                        },
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFFC56464),
                        //size: 25,
                      ),
                      hintText: 'Mật Khẩu',
                      hintStyle: TextStyle(
                        color: Color(0xFFC56464),
                        fontSize: 18,
                      )),
                ),
              )),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false);
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                width: getWidthSize(context),
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    )
                  ],
                  color: AppColor.theme_iconlogin,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: const Center(
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
