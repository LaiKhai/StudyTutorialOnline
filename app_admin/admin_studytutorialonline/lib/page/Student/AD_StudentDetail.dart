import 'package:admin_studytutorialonline/provider/Student/StudentProvider.dart';
import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';
import '../../data/Student.dart';
import '../../data/User.dart';
import '../../widget/InputForm.dart';

class StudentDetail extends StatefulWidget {
  final int studentId;
  final User us;
  const StudentDetail({Key? key, required this.studentId, required this.us})
      : super(key: key);

  @override
  State<StudentDetail> createState() =>
      _StudentDetailState(studentId: studentId, us: us);
}

class _StudentDetailState extends State<StudentDetail> {
  final User us;
  final int studentId;
  _StudentDetailState({required this.studentId, required this.us});
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
            future: StudentProvider.studentDetail(context, studentId),
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
                              isRead: true,
                              txtController: _emailController,
                              title: 'Email',
                              hinttext: student.email!,
                              labeltext: student.email!,
                              preIcon: Icons.email),
                          FormInput(
                              isRead: true,
                              txtController: _passController,
                              title: 'Password',
                              hinttext: student.password!,
                              labeltext: student.password!,
                              preIcon: Icons.password_rounded),
                          FormInput(
                              isRead: true,
                              txtController: _nameController,
                              title: 'Họ tên',
                              hinttext: student.hoTen!,
                              labeltext: student.hoTen!,
                              preIcon: Icons.person),
                          FormInput(
                              isRead: true,
                              txtController: _masoController,
                              title: 'Mã số sinh viên',
                              hinttext: student.maSo!,
                              labeltext: student.maSo!,
                              preIcon: Icons.info_rounded),
                          FormInput(
                              isRead: true,
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
                                        'Xóa',
                                        style: ggTextStyle(20, FontWeight.bold,
                                            AppColor.white),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: Text(
                                                    'Bạn có chắc muốn xóa ${student.hoTen}',
                                                    style: ggTextStyle(
                                                        13,
                                                        FontWeight.bold,
                                                        AppColor.black)),
                                                title: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.warning_rounded,
                                                      color: AppColor.theme,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('Thông báo',
                                                        style: ggTextStyle(
                                                            13,
                                                            FontWeight.bold,
                                                            AppColor.black))
                                                  ],
                                                ),
                                                actions: [
                                                  Container(
                                                    child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text('Không',
                                                            style: ggTextStyle(
                                                                13,
                                                                FontWeight.bold,
                                                                AppColor
                                                                    .black))),
                                                  ),
                                                  Container(
                                                    child: TextButton(
                                                        onPressed: () {
                                                          StudentProvider
                                                              .deleteStudent(
                                                                  context,
                                                                  student.idLop
                                                                      .toString(),
                                                                  student
                                                                      .email!,
                                                                  student
                                                                      .password!,
                                                                  student.maSo!,
                                                                  student.sdt!,
                                                                  student
                                                                      .hoTen!,
                                                                  student
                                                                      .ngaySinh!,
                                                                  us,
                                                                  studentId);
                                                        },
                                                        child: Text('Có',
                                                            style: ggTextStyle(
                                                                13,
                                                                FontWeight.bold,
                                                                AppColor
                                                                    .black))),
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  AppColor.red),
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
