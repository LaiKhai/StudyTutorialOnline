import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';

class CreateDepartmentPage extends StatefulWidget {
  const CreateDepartmentPage({Key? key}) : super(key: key);

  @override
  State<CreateDepartmentPage> createState() => _CreateDepartmentPageState();
}

class _CreateDepartmentPageState extends State<CreateDepartmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.theme),
        backgroundColor: AppColor.white,
      ),
      body: SingleChildScrollView(
          child: Container(
        color: AppColor.white,
        width: getWidthSize(context),
        height: getHeightSize(context),
        child: Column(children: [
          Container(
            padding:
                EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 20, 0, 0),
            width: getWidthSize(context),
            child: Text(
              'Tạo Khoa',
              style: ggTextStyle(40, FontWeight.bold, AppColor.theme),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 20,
                getWidthSize(context) * 0.05, 20),
            height: 5,
            width: getWidthSize(context),
            color: AppColor.theme,
          ),
        ]),
      )),
    );
  }
}
