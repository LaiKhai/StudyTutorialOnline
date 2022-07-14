import 'dart:convert';
import 'dart:io';

import 'package:StudyTutorialOnlineAdmin/provider/ClassPart/ClassPartProvider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';
import '../../data/User.dart';
import 'package:http/http.dart' as http;

class CreateClassPart extends StatefulWidget {
  final User us;

  const CreateClassPart({Key? key, required this.us}) : super(key: key);

  @override
  State<CreateClassPart> createState() => _CreateClassPartState(us: us);
}

class _CreateClassPartState extends State<CreateClassPart> {
  final User us;

  _CreateClassPartState({required this.us});
  TextEditingController _tenBoMonController = TextEditingController();
  int? selectedValue;
  List subjectlist = [];
  Future getAllSubject() async {
    var response = await http.get(Uri.parse(createSubjectObject));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body)['bomon'];
      setState(() {
        subjectlist = jsonData;
      });
    }
  }

  int? selectedClassValue;
  List lstClass = [];
  Future getAllClass() async {
    var response = await http.get(Uri.parse(fetchClassObject));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body)['lop'];
      setState(() {
        lstClass = jsonData;
      });
    }
  }

  File? imgClassPart;
  chonAnh() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      imgClassPart = File(result.files.single.path!);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllSubject();
    getAllClass();
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
                      'Tạo Lớp Học Phần',
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
                      'Tên bộ môn',
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
                      hint: Text('Chọn Bộ Môn...'),
                      items: subjectlist.map((subject) {
                        return DropdownMenuItem(
                          value: subject['id'],
                          child: Text(subject['ten_mon_hoc']),
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
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                        10, getWidthSize(context) * 0.05, 10),
                    width: getWidthSize(context),
                    child: Text(
                      'Tên lớp',
                      style: ggTextStyle(13, FontWeight.bold, AppColor.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                        15, getWidthSize(context) * 0.05, 10),
                    width: getWidthSize(context),
                    height: getHeightSize(context) * 0.07,
                    child: DropdownButton(
                      value: selectedClassValue,
                      isExpanded: true,
                      hint: Text('Chọn lớp...'),
                      items: lstClass.map((classObject) {
                        return DropdownMenuItem(
                          value: classObject['id'],
                          child: Text(classObject['ten_lop']),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedClassValue = value as int?;
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 300,
                    width: getWidthSize(context),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 300,
                        width: getWidthSize(context),
                        decoration: BoxDecoration(
                            image: imgClassPart != null
                                ? DecorationImage(
                                    image: FileImage(imgClassPart!),
                                    fit: BoxFit.scaleDown)
                                : null),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.06,
                        10, getWidthSize(context) * 0.06, 10),
                    width: getWidthSize(context),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(2, 10, 0, 0),
                            width: getWidthSize(context) * 0.86,
                            height: getHeightSize(context) * 0.06,
                            child: ElevatedButton(
                              child: Text(
                                'Thêm Ảnh +',
                                style: ggTextStyle(
                                    20, FontWeight.bold, AppColor.white),
                              ),
                              onPressed: () {
                                imgClassPart = null;
                                chonAnh();
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
                              onPressed: () {
                                if (selectedClassValue != null &&
                                    selectedValue != null) {
                                  ClassPartProvider.createClassPart(
                                      context,
                                      imgClassPart!,
                                      selectedValue.toString(),
                                      selectedClassValue.toString(),
                                      us);
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            'Thông Báo',
                                            style: ggTextStyle(
                                                20,
                                                FontWeight.bold,
                                                AppColor.black),
                                          ),
                                          content: Text(
                                            'Yêu cầu điền đầy đủ thông tin',
                                            style: ggTextStyle(
                                                13,
                                                FontWeight.normal,
                                                AppColor.black),
                                          ),
                                          actions: [
                                            Container(
                                                width:
                                                    getWidthSize(context) * 0.4,
                                                height: getHeightSize(context) *
                                                    0.06,
                                                child: TextButton(
                                                  child: Text(
                                                    'Quay lại',
                                                    style: ggTextStyle(
                                                        20,
                                                        FontWeight.bold,
                                                        AppColor.black),
                                                  ),
                                                  onPressed: () {},
                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              side: BorderSide(
                                                                  color: AppColor
                                                                      .black,
                                                                  width: 1)))),
                                                )),
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
                ]))));
  }
}
