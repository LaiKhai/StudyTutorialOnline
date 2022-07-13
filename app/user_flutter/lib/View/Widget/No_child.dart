import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class NoChild extends StatelessWidget {
  String icon;
  NoChild({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: SvgPicture.asset(
      'assets/images/svg/' + icon,
      color: US_APP_COLOR_2,
      width: 150,
      height: 150,
    )));
  }
}
