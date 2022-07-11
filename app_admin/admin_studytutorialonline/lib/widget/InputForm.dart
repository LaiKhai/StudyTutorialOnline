import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';

class FormInput extends StatelessWidget {
  final String title;
  final String hinttext;
  final String labeltext;
  final IconData preIcon;
  const FormInput(
      {Key? key,
      required this.title,
      required this.hinttext,
      required this.labeltext,
      required this.preIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 10,
                getWidthSize(context) * 0.05, 10),
            width: getWidthSize(context),
            child: Text(
              title,
              style: ggTextStyle(13, FontWeight.bold, AppColor.black),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 5,
                getWidthSize(context) * 0.05, 20),
            child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(preIcon),
                    hintText: hinttext,
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: AppColor.theme)),
                    labelText: labeltext)),
          )
        ],
      ),
    );
  }
}
