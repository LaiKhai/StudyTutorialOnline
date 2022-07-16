import 'dart:convert';

import 'package:StudyTutorialOnlineAdmin/common/contrains/dimen.dart';
import 'package:StudyTutorialOnlineAdmin/provider/Teacher/TeacherDateTimePicker.dart';
import 'package:StudyTutorialOnlineAdmin/provider/Teacher/TeacherProvider.dart';
import 'package:StudyTutorialOnlineAdmin/widget/InputForm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/color.dart';
import '../../common/contrains/string.dart';
import 'package:http/http.dart' as http;

import '../../data/User.dart';

class CreateTeacher extends StatefulWidget {
  final User us;
  const CreateTeacher({Key? key, required this.us}) : super(key: key);

  @override
  State<CreateTeacher> createState() => _CreateTeacherState(us: us);
}

class _CreateTeacherState extends State<CreateTeacher> {
  final User us;
  _CreateTeacherState({required this.us});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _masoController = TextEditingController();
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

  int? selectedValue;
  List departmentItemList = [];
  Future getAllDepartment() async {
    var response = await http.get(Uri.parse(fetchDepartmentObject));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body)['khoa'];
      setState(() {
        departmentItemList = jsonData;
      });
    }
  }

  int? positionValue;
  List positionItemList = [];
  Future getAllPosition() async {
    var response = await http.get(Uri.parse(fetchPosition));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body)['chucvu'];
      setState(() {
        positionItemList = jsonData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllDepartment();
    getAllPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.theme),
          backgroundColor: AppColor.white,
        ),
        body: CustomScrollView(
          key: centerKey,
          slivers: <Widget>[
            SliverList(
              key: centerKey,
              delegate: SliverChildListDelegate([
                Container(
                    color: AppColor.white,
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            getWidthSize(context) * 0.05, 20, 0, 0),
                        width: getWidthSize(context),
                        child: Text(
                          'Tạo Tài Khoản Giảng Viên',
                          style:
                              ggTextStyle(30, FontWeight.bold, AppColor.theme),
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
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            getWidthSize(context) * 0.05,
                            10,
                            getWidthSize(context) * 0.05,
                            10),
                        width: getWidthSize(context),
                        child: Text(
                          'Tên Khoa',
                          style:
                              ggTextStyle(13, FontWeight.bold, AppColor.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            getWidthSize(context) * 0.05,
                            15,
                            getWidthSize(context) * 0.05,
                            10),
                        width: getWidthSize(context),
                        height: getHeightSize(context) * 0.07,
                        child: DropdownButton(
                          value: selectedValue,
                          isExpanded: true,
                          hint: Text('Chọn Khoa...'),
                          items: departmentItemList.map((department) {
                            return DropdownMenuItem(
                              value: department['id'],
                              child: Text(department['ten_khoa']),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as int?;
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            getWidthSize(context) * 0.05,
                            10,
                            getWidthSize(context) * 0.05,
                            10),
                        width: getWidthSize(context),
                        child: Text(
                          'Tên Chức Vụ',
                          style:
                              ggTextStyle(13, FontWeight.bold, AppColor.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            getWidthSize(context) * 0.05,
                            15,
                            getWidthSize(context) * 0.05,
                            10),
                        width: getWidthSize(context),
                        height: getHeightSize(context) * 0.07,
                        child: DropdownButton(
                          value: positionValue,
                          isExpanded: true,
                          hint: Text('Chọn Chức Vụ...'),
                          items: positionItemList.map((position) {
                            return DropdownMenuItem(
                              value: position['id'],
                              child: Text(position['ten_chuc_vu']),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              positionValue = value as int?;
                            });
                          },
                        ),
                      ),
                      FormInput(
                          isRead: false,
                          txtController: _emailController,
                          title: 'Email',
                          hinttext: 'Nhập email...',
                          labeltext: 'Email',
                          preIcon: Icons.email),
                      FormInput(
                          isRead: false,
                          txtController: _passController,
                          title: 'Password',
                          hinttext: 'Nhập password...',
                          labeltext: 'password',
                          preIcon: Icons.password_rounded),
                      FormInput(
                          isRead: false,
                          txtController: _nameController,
                          title: 'Họ tên',
                          hinttext: 'Nhập họ tên...',
                          labeltext: 'Họ tên',
                          preIcon: Icons.person),
                      FormInput(
                          isRead: false,
                          txtController: _masoController,
                          title: 'Mã số giảng viên',
                          hinttext: 'Nhập mã số...',
                          labeltext: 'Mã số',
                          preIcon: Icons.info_rounded),
                      FormInput(
                          isRead: false,
                          txtController: _phoneController,
                          title: 'Số điện thoại',
                          hinttext: 'Nhập số điện thoại...',
                          labeltext: 'Số điện thoại',
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
                          style:
                              ggTextStyle(13, FontWeight.bold, AppColor.black),
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
                            onTap: () {
                              setState(() {
                                _selectedDate(context);
                              });
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.date_range),
                                hintText: _dateFormat.format(_date),
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: AppColor.theme)),
                                labelText: 'Ngày sinh')),
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
                                    style: ggTextStyle(
                                        20, FontWeight.bold, AppColor.black),
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
                                    style: ggTextStyle(
                                        20, FontWeight.bold, AppColor.white),
                                  ),
                                  onPressed: () {
                                    if (selectedValue != null &&
                                        positionValue != null &&
                                        _emailController != null &&
                                        _passController != null &&
                                        _masoController != null &&
                                        _phoneController != null &&
                                        _nameController != null &&
                                        _date != null) {
                                      TeacherProvider.createStudent(
                                          context,
                                          _emailController.text,
                                          _passController.text,
                                          _masoController.text,
                                          _phoneController.text,
                                          _nameController.text,
                                          _dateFormat.format(_date),
                                          positionValue.toString(),
                                          selectedValue.toString(),
                                          us);
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Text(
                                                  'Yêu cầu điền đầy đủ thông tin !',
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
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('Quay lại',
                                                        style: ggTextStyle(
                                                            13,
                                                            FontWeight.bold,
                                                            AppColor.black)))
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
                                        borderRadius: BorderRadius.circular(10),
                                      ))),
                                ))
                          ],
                        ),
                      )
                    ]))
              ]),
            )
          ],
        ));
  }
}
