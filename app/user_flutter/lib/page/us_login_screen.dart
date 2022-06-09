import 'package:flutter/material.dart';
import 'package:user_flutter/Widget/Login_page/us_textfield.dart';

import '../common/constant/dimen.dart';

// ignore: camel_case_types
class US_Login_Screen extends StatelessWidget {
  const US_Login_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: getHeightSize(context),
          width: getWidthSize(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/jpg/back_ground_login.jpg',
              ).image,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        Container(
          height: getHeightSize(context),
          width: getWidthSize(context),
          child: US_TextField_Login(),
        )
      ],
    ));
  }
}
