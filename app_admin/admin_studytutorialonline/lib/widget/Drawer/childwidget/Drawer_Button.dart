import 'package:StudyTutorialOnlineAdmin/common/contrains/color.dart';
import 'package:StudyTutorialOnlineAdmin/provider/LoginPage/LoginProvider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 70),
      child: GestureDetector(
        onTap: () {
          LoginProvider.logout(context);
        },
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_back, size: 22, color: AppColor.theme),
              SizedBox(
                width: 5,
              ),
              Text(
                'Đăng xuất',
                style: TextStyle(
                  color: AppColor.theme,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
