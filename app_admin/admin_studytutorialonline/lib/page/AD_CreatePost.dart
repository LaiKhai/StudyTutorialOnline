import 'dart:convert';

import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import 'package:http/http.dart' as http;

import '../common/contrains/string.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  int? selectedValue;
  List subjectlist = [];
  Future getAllSubject() async {
    var response = await http.get(Uri.parse(getAllClassPart));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body)['lophocphan'];
      setState(() {
        subjectlist = jsonData;
      });
    }
  }

  int? selectedClassValue;
  List lstClass = [];
  Future getAllClass() async {
    var response = await http.get(Uri.parse(getAllTypePost));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body)['loaibaiviet'];
      setState(() {
        lstClass = jsonData;
      });
    }
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
                    'Tạo Bài Viết',
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
                  margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 10,
                      getWidthSize(context) * 0.05, 10),
                  width: getWidthSize(context),
                  child: Text(
                    'Lớp Học Phần',
                    style: ggTextStyle(13, FontWeight.bold, AppColor.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 15,
                      getWidthSize(context) * 0.05, 10),
                  width: getWidthSize(context),
                  height: getHeightSize(context) * 0.07,
                  child: DropdownButton(
                    value: selectedValue,
                    isExpanded: true,
                    hint: Text('Chọn Lớp Học Phần...'),
                    items: subjectlist.map((subject) {
                      return DropdownMenuItem(
                        value: subject['id'],
                        child: Text(subject['bomon']['ten_mon_hoc']),
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
                  margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 10,
                      getWidthSize(context) * 0.05, 10),
                  width: getWidthSize(context),
                  child: Text(
                    'Loại bài viết',
                    style: ggTextStyle(13, FontWeight.bold, AppColor.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 15,
                      getWidthSize(context) * 0.05, 10),
                  width: getWidthSize(context),
                  height: getHeightSize(context) * 0.07,
                  child: DropdownButton(
                    value: selectedClassValue,
                    isExpanded: true,
                    hint: Text('Chọn loại bài viết...'),
                    items: lstClass.map((classObject) {
                      return DropdownMenuItem(
                        value: classObject['id'],
                        child: Text(classObject['ten_loai']),
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
                  margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 10,
                      getWidthSize(context) * 0.05, 10),
                  width: getWidthSize(context),
                  child: Text(
                    'Nội dung',
                    style: ggTextStyle(13, FontWeight.bold, AppColor.black),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: TextFormField(
                      minLines: 2,
                      maxLines: 15,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          hintText: 'Nhập nội dung...',
                          hintStyle: TextStyle(color: AppColor.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: getWidthSize(context),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          width: getWidthSize(context) * 0.9,
                          height: getHeightSize(context) * 0.06,
                          child: ElevatedButton(
                            child: Text(
                              'Thêm File +',
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
                          )),
                    ],
                  ),
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
              ]))),
    );
  }
}
