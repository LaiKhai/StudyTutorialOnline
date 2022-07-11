import 'package:admin_studytutorialonline/provider/Student/StudentProvider.dart';
import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';
import '../data/Student.dart';
import '../widget/InputForm.dart';

class StudentDetail extends StatefulWidget {
  final int studentId;
  const StudentDetail({Key? key, required this.studentId}) : super(key: key);

  @override
  State<StudentDetail> createState() =>
      _StudentDetailState(studentId: studentId);
}

class _StudentDetailState extends State<StudentDetail> {
  final int studentId;
  _StudentDetailState({required this.studentId});
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
                Student student = snapshot.data!;
                if (student.trang_thai != "0") {
                  return SingleChildScrollView(
                    child: Container(
                        color: AppColor.white,
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                getWidthSize(context) * 0.05, 20, 0, 0),
                            width: getWidthSize(context),
                            child: Text(
                              student.ho_ten,
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
                              isRead: true,
                              txtController: _emailController,
                              title: 'Email',
                              hinttext: 'Nhập email...',
                              labeltext: student.email,
                              preIcon: Icons.email),
                          FormInput(
                              isRead: true,
                              txtController: _passController,
                              title: 'Password',
                              hinttext: 'Nhập password...',
                              labeltext: student.password,
                              preIcon: Icons.password_rounded),
                          FormInput(
                              isRead: true,
                              txtController: _nameController,
                              title: 'Họ tên',
                              hinttext: 'Nhập họ tên...',
                              labeltext: student.ho_ten,
                              preIcon: Icons.person),
                          FormInput(
                              isRead: true,
                              txtController: _masoController,
                              title: 'Mã số sinh viên',
                              hinttext: 'Nhập mã số...',
                              labeltext: student.ma_so,
                              preIcon: Icons.info_rounded),
                          FormInput(
                              isRead: true,
                              txtController: _phoneController,
                              title: 'Số điện thoại',
                              hinttext: 'Nhập số điện thoại...',
                              labeltext: student.sdt,
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
                                    hintText: "22/07/2001",
                                    border: new OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: AppColor.theme)),
                                    labelText: student.ngay_sinh)),
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
                                    width: getWidthSize(context) * 0.4,
                                    height: getHeightSize(context) * 0.06,
                                    child: TextButton(
                                      child: Text(
                                        'Hủy',
                                        style: ggTextStyle(20, FontWeight.bold,
                                            AppColor.black),
                                      ),
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  side: BorderSide(
                                                      color: AppColor.black,
                                                      width: 1)))),
                                    )),
                                Container(
                                    margin: EdgeInsets.fromLTRB(
                                        getWidthSize(context) * 0.08, 0, 0, 0),
                                    width: getWidthSize(context) * 0.4,
                                    height: getHeightSize(context) * 0.06,
                                    child: ElevatedButton(
                                      child: Text(
                                        'Thêm',
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
