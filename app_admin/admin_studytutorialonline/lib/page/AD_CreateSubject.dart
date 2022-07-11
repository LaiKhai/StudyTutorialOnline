import 'dart:convert';

import 'package:admin_studytutorialonline/widget/InputForm.dart';
import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';
import 'package:http/http.dart' as http;

class CreateSubject extends StatefulWidget {
  const CreateSubject({Key? key}) : super(key: key);

  @override
  State<CreateSubject> createState() => _CreateSubjectState();
}

class _CreateSubjectState extends State<CreateSubject> {
  String? selectedValue;
  List departmentItemList = [];
  Future getAllDepartment() async {
    var response = await http.get(Uri.parse(fetchDepartmentObject));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body)['khoa'];
      setState(() {
        departmentItemList = jsonData;
      });
    }
    print(departmentItemList);
  }

  final List item2 = [
    {'value': 1, 'key': 'Lý Thuyết'},
    {'value': 2, 'key': 'Thực Hành'},
    {'value': 3, 'key': 'Module'}
  ];
  int? value2;

  @override
  void initState() {
    super.initState();
    getAllDepartment();
  }

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
                      'Tạo Bộ Môn',
                      style: ggTextStyle(40, FontWeight.bold, AppColor.theme),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                        20, getWidthSize(context) * 0.05, 20),
                    height: 5,
                    width: getWidthSize(context),
                    color: AppColor.theme,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                        10, getWidthSize(context) * 0.05, 10),
                    width: getWidthSize(context),
                    child: Text(
                      'Tên Khoa',
                      style: ggTextStyle(13, FontWeight.bold, AppColor.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                        15, getWidthSize(context) * 0.05, 10),
                    width: getWidthSize(context),
                    height: getHeightSize(context) * 0.07,
                    child: DropdownButton(
                      value: selectedValue,
                      isExpanded: true,
                      hint: Text('Chọn Khoa...'),
                      items: departmentItemList.map((department) {
                        return DropdownMenuItem(
                          value: department['ten_khoa'],
                          child: Text(department['ten_khoa']),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String?;
                        });
                      },
                    ),
                  ),
                  FormInput(
                      title: 'Bộ môn',
                      hinttext: 'Nhập bộ môn...',
                      labeltext: 'Bộ môn',
                      preIcon: Icons.book),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                        10, getWidthSize(context) * 0.05, 10),
                    width: getWidthSize(context),
                    child: Text(
                      'Loại môn học',
                      style: ggTextStyle(13, FontWeight.bold, AppColor.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                        15, getWidthSize(context) * 0.05, 10),
                    width: getWidthSize(context),
                    height: getHeightSize(context) * 0.07,
                    child: DropdownButton(
                      value: value2,
                      isExpanded: true,
                      hint: Text('Chọn loại môn học...'),
                      items: item2.map((item) {
                        return DropdownMenuItem(
                          value: item['value'],
                          child: Text(item['key'].toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          value2 = value as int?;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.06,
                        10, getWidthSize(context) * 0.06, 10),
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
                ]))));
  }
}

DropdownMenuItem<String> buildItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: ggTextStyle(15, FontWeight.w600, AppColor.black),
    ));

DropdownMenuItem<String> buildItem2(String item2) => DropdownMenuItem(
    value: item2,
    child: Text(
      item2,
      style: ggTextStyle(15, FontWeight.w600, AppColor.black),
    ));
