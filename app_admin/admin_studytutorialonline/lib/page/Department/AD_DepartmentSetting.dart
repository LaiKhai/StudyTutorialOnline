import 'package:admin_studytutorialonline/data/Department.dart';
import 'package:admin_studytutorialonline/provider/Department/DepartmentProvider.dart';
import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';
import '../../data/User.dart';
import '../../data/User.dart';
import '../../widget/InputForm.dart';

class DepartmentSetting extends StatefulWidget {
  final int departmentId;
  final User us;
  const DepartmentSetting(
      {Key? key, required this.departmentId, required this.us})
      : super(key: key);

  @override
  State<DepartmentSetting> createState() =>
      _DepartmentSettingState(departmentId: departmentId, us: us);
}

class _DepartmentSettingState extends State<DepartmentSetting> {
  final User us;
  final int departmentId;
  TextEditingController _tenkhoaController = TextEditingController();
  _DepartmentSettingState({required this.departmentId, required this.us});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.theme),
          backgroundColor: AppColor.white,
        ),
        body: FutureBuilder<Department?>(
            future: DepartmentProvider.departmentDetail(context, departmentId),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Có lỗi xảy ra !'),
                );
              } else if (snapshot.hasData) {
                Department department = snapshot.data!;
                if (department.trangthai != "0") {
                  return SingleChildScrollView(
                    child: Container(
                        color: AppColor.white,
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                getWidthSize(context) * 0.05, 20, 0, 0),
                            width: getWidthSize(context),
                            child: Text(
                              department.tenkhoa,
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
                              txtController: _tenkhoaController,
                              title: 'Tên khoa',
                              hinttext: department.tenkhoa,
                              labeltext: department.tenkhoa,
                              preIcon: Icons.cast_for_education),
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
                                      onPressed: () {
                                        if (_tenkhoaController.text == "") {
                                          _tenkhoaController.text =
                                              department.tenkhoa.toString();
                                        } else if (_tenkhoaController.text !=
                                            "") {
                                          DepartmentProvider.updateDepartment(
                                              context,
                                              _tenkhoaController.text,
                                              us,
                                              departmentId);
                                        } else {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'Yêu cầu điền đầy đủ thông tin',
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
                                                          child: Text(
                                                              'Quay lại',
                                                              style: ggTextStyle(
                                                                  13,
                                                                  FontWeight
                                                                      .bold,
                                                                  AppColor
                                                                      .black))),
                                                    ),
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
