import 'dart:convert';

import 'package:admin_studytutorialonline/provider/Subject/SubjectProvider.dart';
import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';
import 'package:http/http.dart' as http;

import '../../data/Subject.dart';
import '../../data/User.dart';

class SubjectSetting extends StatefulWidget {
  final int subjectId;
  final User us;
  const SubjectSetting({Key? key, required this.subjectId, required this.us})
      : super(key: key);

  @override
  State<SubjectSetting> createState() =>
      _SubjectSettingState(subjectId: subjectId, us: us);
}

class _SubjectSettingState extends State<SubjectSetting> {
  final User us;
  TextEditingController _tenmonhocController = TextEditingController();
  Text loaiMonHoc(String subjectObject) {
    if (subjectObject == "1") {
      return Text(
        'Lý Thuyết',
        style: ggTextStyle(13, FontWeight.bold, AppColor.grey),
      );
    } else if (subjectObject == "2") {
      return Text('Thực Hành',
          style: ggTextStyle(13, FontWeight.bold, AppColor.grey));
    } else if (subjectObject == "3") {
      return Text('Module',
          style: ggTextStyle(13, FontWeight.bold, AppColor.grey));
    }
    return Text('Không có loại môn học nào...');
  }

  final int subjectId;
  _SubjectSettingState({required this.subjectId, required this.us});
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
        body: FutureBuilder<Subject?>(
          future: SubjectProvider.subjectDetail(context, subjectId),
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Có lỗi xảy ra !'),
              );
            } else if (snapshot.hasData) {
              OnlySubject subjectObject = snapshot.data!.only_subject!;
              return SingleChildScrollView(
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
                            'Chỉnh sửa bộ môn',
                            style: ggTextStyle(
                                40, FontWeight.bold, AppColor.theme),
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
                            style: ggTextStyle(
                                13, FontWeight.bold, AppColor.black),
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
                            hint: Text(
                              subjectObject.tenKhoa!,
                              style: ggTextStyle(
                                  13, FontWeight.bold, AppColor.grey),
                            ),
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
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    getWidthSize(context) * 0.05,
                                    10,
                                    getWidthSize(context) * 0.05,
                                    10),
                                width: getWidthSize(context),
                                child: Text(
                                  'Tên bộ môn',
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
                                child: TextField(
                                    controller: _tenmonhocController,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.book),
                                      hintText: subjectObject.tenMonHoc,
                                      border: new OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: AppColor.theme)),
                                    )),
                              )
                            ],
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
                            'Loại môn học',
                            style: ggTextStyle(
                                13, FontWeight.bold, AppColor.black),
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
                            value: value2,
                            isExpanded: true,
                            hint:
                                loaiMonHoc(subjectObject.loaiMonHoc.toString()),
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
                                      'Quay lại',
                                      style: ggTextStyle(
                                          20, FontWeight.bold, AppColor.black),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
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
                                      'Sửa',
                                      style: ggTextStyle(
                                          20, FontWeight.bold, AppColor.white),
                                    ),
                                    onPressed: () {
                                      SubjectProvider.updateSubject(
                                          context,
                                          selectedValue.toString(),
                                          _tenmonhocController.text,
                                          value2.toString(),
                                          us,
                                          subjectId);
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
                      ])));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
        ));
  }
}
