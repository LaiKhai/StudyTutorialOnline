import 'package:StudyTutorialOnlineAdmin/data/Teacher.dart';
import 'package:StudyTutorialOnlineAdmin/provider/Teacher/TeacherProvider.dart';
import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';
import '../../data/User.dart';
import '../../widget/InputForm.dart';

class TeacherDetail extends StatefulWidget {
  final int teacherID;
  final User us;
  const TeacherDetail({Key? key, required this.teacherID, required this.us})
      : super(key: key);

  @override
  State<TeacherDetail> createState() =>
      _TeacherDetailState(teacherID: teacherID, us: us);
}

class _TeacherDetailState extends State<TeacherDetail> {
  final User us;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _masoController = TextEditingController();
  final int teacherID;
  _TeacherDetailState({required this.teacherID, required this.us});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.theme),
          backgroundColor: AppColor.white,
        ),
        body: FutureBuilder<Teacher?>(
            future: TeacherProvider.teacherDetail(context, teacherID),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Có lỗi xảy ra !'),
                );
              } else if (snapshot.hasData) {
                GiangVien giangvien = snapshot.data!.giangvien!;
                if (giangvien.trangThai != "0") {
                  return SingleChildScrollView(
                    child: Container(
                        color: AppColor.white,
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                getWidthSize(context) * 0.05, 20, 0, 0),
                            width: getWidthSize(context),
                            child: Text(
                              giangvien.hoTen!,
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
                              hinttext: giangvien.email!,
                              labeltext: giangvien.email!,
                              preIcon: Icons.email),
                          FormInput(
                              isRead: true,
                              txtController: _passController,
                              title: 'Password',
                              hinttext: giangvien.password!,
                              labeltext: giangvien.password!,
                              preIcon: Icons.password_rounded),
                          FormInput(
                              isRead: true,
                              txtController: _nameController,
                              title: 'Họ tên',
                              hinttext: giangvien.hoTen!,
                              labeltext: giangvien.hoTen!,
                              preIcon: Icons.person),
                          FormInput(
                              isRead: true,
                              txtController: _masoController,
                              title: 'Mã số sinh viên',
                              hinttext: giangvien.maSo!,
                              labeltext: giangvien.maSo!,
                              preIcon: Icons.info_rounded),
                          FormInput(
                              isRead: true,
                              txtController: _phoneController,
                              title: 'Số điện thoại',
                              hinttext: giangvien.sdt!,
                              labeltext: giangvien.sdt!,
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
                                    hintText: giangvien.ngaySinh!,
                                    border: new OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: AppColor.theme)),
                                    labelText: giangvien.ngaySinh!)),
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
                                                    'Bạn có chắc muốn xóa ${giangvien.hoTen}',
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
                                                          TeacherProvider.deleteTeacher(
                                                              context,
                                                              giangvien.idKhoa
                                                                  .toString(),
                                                              giangvien.email
                                                                  .toString(),
                                                              giangvien.password
                                                                  .toString(),
                                                              giangvien.maSo
                                                                  .toString(),
                                                              giangvien.sdt
                                                                  .toString(),
                                                              giangvien.hoTen
                                                                  .toString(),
                                                              giangvien.ngaySinh
                                                                  .toString(),
                                                              giangvien.idChucVu
                                                                  .toString(),
                                                              us,
                                                              teacherID);
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
