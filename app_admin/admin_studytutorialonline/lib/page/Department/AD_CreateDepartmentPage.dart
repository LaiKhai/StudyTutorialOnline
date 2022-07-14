import 'package:admin_studytutorialonline/provider/Department/DepartmentProvider.dart';
import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';
import '../data/User.dart';

class CreateDepartmentPage extends StatefulWidget {
  final User us;
  const CreateDepartmentPage({Key? key, required this.us}) : super(key: key);

  @override
  State<CreateDepartmentPage> createState() =>
      _CreateDepartmentPageState(us: us);
}

class _CreateDepartmentPageState extends State<CreateDepartmentPage> {
  TextEditingController _tenkhoaController = TextEditingController();
  final User us;
  _CreateDepartmentPageState({required this.us});
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
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 10,
                      getWidthSize(context) * 0.05, 10),
                  width: getWidthSize(context),
                  child: Text(
                    'Tên Khoa',
                    style: ggTextStyle(13, FontWeight.bold, AppColor.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 5,
                      getWidthSize(context) * 0.05, 20),
                  child: TextField(
                      controller: _tenkhoaController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.cast_for_education),
                          hintText: 'Nhập tên khoa...',
                          border: new OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: AppColor.theme)),
                          labelText: 'Tên Khoa')),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.06, 10,
                      getWidthSize(context) * 0.06, 10),
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
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                            color: AppColor.black, width: 1)))),
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
                              DepartmentProvider.createDepartment(
                                  context, _tenkhoaController.text, us);
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
              ],
            ),
          )
        ]),
      )),
    );
  }
}
