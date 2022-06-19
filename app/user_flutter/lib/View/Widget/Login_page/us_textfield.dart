import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Model_View/login.dart';
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
  bool checkboxListTileValue = true;
  bool isGiangVien = true;
  void _toggleButtonViewPassword() {
    setState(() {
      isGiangVien = !isGiangVien;
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
// Generated code for this CheckboxListTile Widget...

          Container(
            padding: const EdgeInsets.only(top: 40),
            child: TextField(
              controller: _emailController,
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.quicksand(color: US_APP_WHITE, fontSize: 15),
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
                labelStyle:
                    GoogleFonts.quicksand(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: TextField(
              controller: _passwordController,
              style: GoogleFonts.quicksand(color: US_APP_WHITE, fontSize: 15),
              obscureText: isGiangVien,
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
                    isGiangVien ? Icons.visibility : Icons.visibility_off,
                    color: US_APP_WHITE,
                    size: 20,
                  ),
                ),
                labelText: 'Mật Khẩu',
                labelStyle:
                    GoogleFonts.quicksand(fontSize: 16, color: US_APP_WHITE),
              ),
            ),
          ),
          Theme(
            data: ThemeData(
              unselectedWidgetColor: Color(0xFF95A1AC),
            ),
            child: CheckboxListTile(
              value: checkboxListTileValue,
              onChanged: (newValue) => setState(
                  () => checkboxListTileValue = !checkboxListTileValue),
              title: Text(
                'Bạn là giảng viên',
                style: GoogleFonts.quicksand(color: Colors.white),
              ),
              tileColor: Color(0xFFF5F5F5),
              activeColor: US_APP_COLOR,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 55,
                width: getWidthSize(context) * 2 / 3,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).pushAndRemoveUntil(
                    //     MaterialPageRoute(
                    //         builder: (context) => Navigator_page()),
                    //     (route) => false);
               
                    Login().login(_emailController.text,
                        _passwordController.text, context, isGiangVien);
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
        ],
      ),
    );
  }
}
