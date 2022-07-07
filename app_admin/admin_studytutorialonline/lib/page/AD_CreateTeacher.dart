import 'package:admin_studytutorialonline/common/contrains/dimen.dart';
import 'package:admin_studytutorialonline/widget/InputForm.dart';
import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/string.dart';

class CreateTeacher extends StatefulWidget {
  const CreateTeacher({Key? key}) : super(key: key);

  @override
  State<CreateTeacher> createState() => _CreateTeacherState();
}

class _CreateTeacherState extends State<CreateTeacher> {
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
                    padding: EdgeInsets.fromLTRB(
                        getWidthSize(context) * 0.05, 20, 0, 0),
                    width: getWidthSize(context),
                    child: Text(
                      'Tạo Tài Khoản Giảng Viên',
                      style: ggTextStyle(30, FontWeight.bold, AppColor.theme),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                        20, getWidthSize(context) * 0.05, 20),
                    height: 5,
                    width: getWidthSize(context),
                    color: AppColor.theme,
                  ),
                  FormInput(
                      title: 'Email',
                      hinttext: 'Nhập email...',
                      labeltext: 'Email',
                      preIcon: Icons.email),
                  FormInput(
                      title: 'Password',
                      hinttext: 'Nhập password...',
                      labeltext: 'password',
                      preIcon: Icons.password_rounded),
                  FormInput(
                      title: 'Họ tên',
                      hinttext: 'Nhập họ tên...',
                      labeltext: 'Họ tên',
                      preIcon: Icons.person),
                  FormInput(
                      title: 'Mã số giảng viên',
                      hinttext: 'Nhập mã số...',
                      labeltext: 'Mã số',
                      preIcon: Icons.info_rounded),
                  FormInput(
                      title: 'Số điện thoại',
                      hinttext: 'Nhập số điện thoại...',
                      labeltext: 'Số điện thoại',
                      preIcon: Icons.phone),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                        20, getWidthSize(context) * 0.05, 10),
                    width: getWidthSize(context),
                    child: Text(
                      'Ngày Sinh',
                      style: ggTextStyle(13, FontWeight.bold, AppColor.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 5,
                        getWidthSize(context) * 0.05, 10),
                  )
                ]))));
  }
}
