import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';
import '../widget/InputForm.dart';

class CreateStudentPage extends StatefulWidget {
  const CreateStudentPage({Key? key}) : super(key: key);

  @override
  State<CreateStudentPage> createState() => _CreateStudentPageState();
}

class _CreateStudentPageState extends State<CreateStudentPage> {
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
                          'Tạo Tài Khoản Sinh Viên',
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
                          title: 'Mã số sinh viên',
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
                                  onPressed: () {},
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
