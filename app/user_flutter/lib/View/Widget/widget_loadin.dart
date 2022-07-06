import 'package:flutter/material.dart';
import 'package:user_flutter/View/common/constant/color.dart';
class Loading extends StatelessWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Color(0xFFF6F9FE),
              child: Center(child: CircularProgressIndicator(strokeWidth: 10,color: US_APP_COLOR,)));
  }
}