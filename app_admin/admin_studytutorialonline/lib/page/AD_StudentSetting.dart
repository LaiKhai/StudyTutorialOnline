import 'package:admin_studytutorialonline/provider/Student/StudentProvider.dart';
import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';
import '../data/Student.dart';
import '../widget/InputForm.dart';

class StudentSetting extends StatefulWidget {
  final int studentId;
  const StudentSetting({Key? key, required this.studentId}) : super(key: key);

  @override
  State<StudentSetting> createState() =>
      _StudentSettingState(studentId: studentId);
}

class _StudentSettingState extends State<StudentSetting> {
  final int studentId;
  _StudentSettingState({required this.studentId});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _masoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.theme),
          backgroundColor: AppColor.white,
        ),
        body: FutureBuilder<Student?>(
            future: StudentProvider.subjectDetail(context, studentId),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Có lỗi xảy ra !'),
                );
              } else if (snapshot.hasData) {
                SinhVien student = snapshot.data!.sinhvien![0];
                if (student.trangThai != "0") {
                  return SingleChildScrollView(
                    child: Container(
                        color: AppColor.white,
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                getWidthSize(context) * 0.05, 20, 0, 0),
                            width: getWidthSize(context),
                            child: Text(
                              student.hoTen!,
                              style: ggTextStyle(
                                  30, FontWeight.bold, AppColor.theme),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                getWidthSize(context) * 0.05,
                                20,
                                getWidthSize(context) * 0.05,
                                20),
                            height: 5,
                            width: getWidthSize(context),
                            color: AppColor.theme,
                          ),
                          FormInput(
                              isRead: false,
                              txtController: _emailController,
                              title: 'Email',
                              hinttext: student.email!,
                              labeltext: student.email!,
                              preIcon: Icons.email),
                          FormInput(
                              isRead: false,
                              txtController: _passController,
                              title: 'Password',
                              hinttext: student.password!,
                              labeltext: student.password!,
                              preIcon: Icons.password_rounded),
                          FormInput(
                              isRead: false,
                              txtController: _nameController,
                              title: 'Họ tên',
                              hinttext: student.hoTen!,
                              labeltext: student.hoTen!,
                              preIcon: Icons.person),
                          FormInput(
                              isRead: false,
                              txtController: _masoController,
                              title: 'Mã số sinh viên',
                              hinttext: student.maSo!,
                              labeltext: student.maSo!,
                              preIcon: Icons.info_rounded),
                          FormInput(
                              isRead: false,
                              txtController: _phoneController,
                              title: 'Số điện thoại',
                              hinttext: student.sdt!,
                              labeltext: student.sdt!,
                              preIcon: Icons.phone),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                getWidthSize(context) * 0.05,
                                10,
                                getWidthSize(context) * 0.05,
                                10),
                            width: getWidthSize(context),
                            child: Text(
                              'Ngày Sinh',
                              style: ggTextStyle(
                                  13, FontWeight.bold, AppColor.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                getWidthSize(context) * 0.05,
                                5,
                                getWidthSize(context) * 0.05,
                                20),
                            child: TextFormField(
                                readOnly: true,
                                onTap: () {},
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.date_range),
                                    hintText: student.ngaySinh!,
                                    border: new OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: AppColor.theme)),
                                    labelText: student.ngaySinh!)),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                getWidthSize(context) * 0.06,
                                10,
                                getWidthSize(context) * 0.06,
                                10),
                            width: getWidthSize(context),
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(2, 10, 0, 0),
                                    width: getWidthSize(context) * 0.86,
                                    height: getHeightSize(context) * 0.06,
                                    child: ElevatedButton(
                                      child: Text(
                                        'chỉnh sửa',
                                        style: ggTextStyle(20, FontWeight.bold,
                                            AppColor.white),
                                      ),
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  AppColor.theme),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ))),
                                    ))
                              ],
                            ),
                          )
                        ])),
                  );
                }
                return Center(
                  child: Text(''),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
