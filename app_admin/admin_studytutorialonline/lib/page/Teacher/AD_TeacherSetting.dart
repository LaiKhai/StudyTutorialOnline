import 'package:StudyTutorialOnlineAdmin/provider/Teacher/TeacherProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';
import '../../data/Teacher.dart';
import '../../data/User.dart';
import '../../widget/InputForm.dart';

class TeacherSetting extends StatefulWidget {
  final int teacherId;
  final User us;
  const TeacherSetting({Key? key, required this.teacherId, required this.us})
      : super(key: key);

  @override
  State<TeacherSetting> createState() =>
      _TeacherSettingState(teacherId: teacherId, us: us);
}

class _TeacherSettingState extends State<TeacherSetting> {
  final User us;
  final int teacherId;
  _TeacherSettingState({required this.teacherId, required this.us});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _masoController = TextEditingController();
  TextEditingController _ngaysinhController = TextEditingController();

  DateTime _date = DateTime.now();
  DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  Future<void> _selectedDate(BuildContext context) async {
    DateTime? _datetime = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1947),
        lastDate: DateTime(2030));
    if (_datetime != null && _datetime != _date) {
      setState(() {
        _date = _datetime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.theme),
          backgroundColor: AppColor.white,
        ),
        body: FutureBuilder<Teacher?>(
            future: TeacherProvider.teacherDetail(context, teacherId),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('C?? l???i x???y ra !'),
                );
              } else if (snapshot.hasData) {
                GiangVien giangviens = snapshot.data!.giangvien!;
                if (giangviens.trangThai != "0") {
                  return SingleChildScrollView(
                    child: Container(
                        color: AppColor.white,
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                getWidthSize(context) * 0.05, 20, 0, 0),
                            width: getWidthSize(context),
                            child: Text(
                              giangviens.hoTen!,
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
                              hinttext: giangviens.email!,
                              labeltext: giangviens.email!,
                              preIcon: Icons.email),
                          FormInput(
                              isRead: false,
                              txtController: _passController,
                              title: 'Password',
                              hinttext: giangviens.password!,
                              labeltext: giangviens.password!,
                              preIcon: Icons.password_rounded),
                          FormInput(
                              isRead: false,
                              txtController: _nameController,
                              title: 'H??? t??n',
                              hinttext: giangviens.hoTen!,
                              labeltext: giangviens.hoTen!,
                              preIcon: Icons.person),
                          FormInput(
                              isRead: false,
                              txtController: _masoController,
                              title: 'M?? s??? sinh vi??n',
                              hinttext: giangviens.maSo!,
                              labeltext: giangviens.maSo!,
                              preIcon: Icons.info_rounded),
                          FormInput(
                              isRead: false,
                              txtController: _phoneController,
                              title: 'S??? ??i???n tho???i',
                              hinttext: giangviens.sdt!,
                              labeltext: giangviens.sdt!,
                              preIcon: Icons.phone),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                getWidthSize(context) * 0.05,
                                10,
                                getWidthSize(context) * 0.05,
                                10),
                            width: getWidthSize(context),
                            child: Text(
                              'Ng??y Sinh',
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
                                controller: _ngaysinhController,
                                readOnly: true,
                                onTap: () {
                                  setState(() {
                                    _selectedDate(context);
                                  });
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.date_range),
                                    hintText: _dateFormat.format(_date),
                                    border: new OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: AppColor.theme)),
                                    labelText: giangviens.ngaySinh)),
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
                                        'ch???nh s???a',
                                        style: ggTextStyle(20, FontWeight.bold,
                                            AppColor.white),
                                      ),
                                      onPressed: () {
                                        if (_emailController.text == "") {
                                          _emailController.text =
                                              giangviens.email!;
                                        } else if (_passController.text == "") {
                                          _passController.text =
                                              giangviens.password!;
                                        } else if (_phoneController.text ==
                                            "") {
                                          _phoneController.text =
                                              giangviens.sdt!;
                                        } else if (_nameController.text == "") {
                                          _nameController.text =
                                              giangviens.hoTen!;
                                        } else if (_masoController.text == "") {
                                          _masoController.text =
                                              giangviens.maSo!;
                                        } else if (_ngaysinhController.text ==
                                            "") {
                                          _ngaysinhController.text =
                                              giangviens.ngaySinh!;
                                        } else if (_emailController.text !=
                                                "" &&
                                            _passController.text != "" &&
                                            _masoController.text != "" &&
                                            _phoneController.text != "" &&
                                            _nameController.text != "" &&
                                            _ngaysinhController.text != "") {
                                          TeacherProvider.updateTeacher(
                                              context,
                                              giangviens.idKhoa,
                                              _emailController.text,
                                              _passController.text,
                                              _masoController.text,
                                              _phoneController.text,
                                              _nameController.text,
                                              _ngaysinhController.text,
                                              giangviens.idChucVu.toString(),
                                              us,
                                              teacherId);
                                        } else {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'Y??u c???u ??i???n ?????y ????? th??ng tin',
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
                                                      Text('Th??ng b??o',
                                                          style: ggTextStyle(
                                                              13,
                                                              FontWeight.bold,
                                                              AppColor.black))
                                                    ],
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                            'Quay l???i danh s??ch b??? m??n',
                                                            style: ggTextStyle(
                                                                13,
                                                                FontWeight.bold,
                                                                AppColor
                                                                    .black)))
                                                  ],
                                                );
                                              });
                                        }
                                      },
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
