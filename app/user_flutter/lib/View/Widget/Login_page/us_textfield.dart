import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_flutter/View/common/constant/dimen.dart';
import 'package:user_flutter/View/page/NaviGa.dart';

import '../../common/constant/color.dart';

class US_TextField_Login extends StatefulWidget {
  const US_TextField_Login({Key? key}) : super(key: key);

  @override
  State<US_TextField_Login> createState() => _US_TextField_LoginState();
}

class _US_TextField_LoginState extends State<US_TextField_Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isHidenPassword = true;
  void _toggleButtonViewPassword() {
    setState(() {
      isHidenPassword = !isHidenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    //textfield login
    return Container(
      margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      width: getWidthSize(context),
      height: getHeightSize(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: US_APP_COLOR,
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/svg/logo_app.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.only(top: 40),
            child: TextField(
              controller: _emailController,
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: US_APP_WHITE, fontSize: 15),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                prefix: Container(
                    margin: EdgeInsets.only(right: 6),
                    child: Icon(
                      Icons.person,
                      size: 15,
                      color: US_APP_WHITE,
                    )),
                labelText: 'Email',
                labelStyle: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 60),
            child: TextField(
              controller: _passwordController,
              style: TextStyle(color: US_APP_WHITE, fontSize: 15),
              obscureText: isHidenPassword,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: US_APP_WHITE)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: US_APP_WHITE),
                ),
                prefix: Container(
                    margin: EdgeInsets.only(right: 6),
                    child: Icon(
                      Icons.lock,
                      size: 15,
                      color: US_APP_WHITE,
                    )),
                suffix: InkWell(
                  onTap: _toggleButtonViewPassword,
                  child: Icon(
                    isHidenPassword ? Icons.visibility : Icons.visibility_off,
                    color: US_APP_WHITE,
                    size: 20,
                  ),
                ),
                labelText: 'Mật Khẩu',
                labelStyle: TextStyle(fontSize: 16, color: US_APP_WHITE),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   height: 55,
              //   width: 142,
              //   child: OutlinedButton(
              //     onPressed: () {},
              //     child: Text(
              //       "Đăng ký",
              //       style: TextStyle(color: US_APP_WHITE),
              //     ),
              //     style: OutlinedButton.styleFrom(
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(30)),
              //         side: BorderSide(color: US_APP_WHITE)),
              //   ),
              // ),

              SizedBox(
                height: 55,
                width: getWidthSize(context) * 2 / 3,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => Navigator_page()),
                        (route) => false);
                    // Login().login(_emailController.text,
                    //     _passwordController.text, context);
                  },
                  child: const Text("Đăng nhập"),
                  style: ElevatedButton.styleFrom(
                      primary: US_APP_COLOR,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                ),
              )
            ],
          ),
          // Container(
          //   padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
          //   child: Text(
          //     "Hoặc qua mạng xã hội",
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
          // // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ElevatedButton(
          //         onPressed: () {},
          //         style: ElevatedButton.styleFrom(
          //             primary: Color.fromRGBO(0, 0, 0, 0),
          //             onPrimary: Color.fromRGBO(0, 0, 0, 0)),
          //         child: Column(
          //           children: [
          //             Container(
          //               padding: EdgeInsets.only(bottom: 10),
          //               child: Icon(
          //                 Icons.facebook,
          //                 color: Color.fromARGB(255, 38, 112, 223),
          //                 size: 50,
          //               ),
          //             ),
          //             Container(
          //               child: Text(
          //                 'Facebook',
          //                 style: TextStyle(color: Colors.white),
          //               ),
          //             )
          //           ],
          //         )),
          //     ElevatedButton(
          //         onPressed: () {},
          //         style: ElevatedButton.styleFrom(
          //             primary: Color.fromRGBO(0, 0, 0, 0),
          //             onPrimary: Color.fromRGBO(0, 0, 0, 0)),
          //         child: Column(
          //           children: [
          //             Container(
          //                 width: 50,
          //                 height: 50,
          //                 padding: EdgeInsets.only(bottom: 10),
          //                 child: Image.asset(
          //                   'assets/images/ic_google_app.png',
          //                   fit: BoxFit.contain,
          //                 )),
          //             Container(
          //               child: Text(
          //                 'Google',
          //                 style: TextStyle(color: Colors.white),
          //               ),
          //             )
          //           ],
          //         ))
          //   ],
          // )
        ],
      ),
    );
  }
}
