import 'dart:convert';
import 'dart:io';

import 'package:StudyTutorialOnlineAdmin/provider/Import_Export_file.dart';
import 'package:StudyTutorialOnlineAdmin/provider/link_url.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';
import '../data/User.dart';
import 'package:http/http.dart' as http;

class Import_Export_DSSV extends StatefulWidget {
  final User us;
  const Import_Export_DSSV({Key? key, required this.us}) : super(key: key);

  @override
  State<Import_Export_DSSV> createState() => _Import_Export_DSSVState(us: us);
}

class _Import_Export_DSSVState extends State<Import_Export_DSSV> {
  final User us;
  _Import_Export_DSSVState({required this.us});
  File? imgClassPart;
  chonAnh() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      imgClassPart = File(result.files.single.path!);
    }
    setState(() {});
  }

  int? selectedValue;
  List departmentItemList = [];
  Future getAllClass() async {
    var response = await http.get(Uri.parse(fetchClassObject));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body)['lop'];
      setState(() {
        departmentItemList = jsonData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
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
              padding:
                  EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 20, 0, 0),
              width: getWidthSize(context),
              child: Text(
                'Export Danh Sách Sinh Viên',
                style: ggTextStyle(24, FontWeight.bold, AppColor.theme),
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
                'Export mẫu danh sách để import',
                style: ggTextStyle(13, FontWeight.normal, AppColor.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.06, 10,
                  getWidthSize(context) * 0.06, 10),
              width: getWidthSize(context),
              child: Container(
                  margin: EdgeInsets.fromLTRB(2, 10, 0, 0),
                  width: getWidthSize(context) * 0.86,
                  height: getHeightSize(context) * 0.06,
                  child: ElevatedButton(
                    child: Text(
                      'Export file danh sách',
                      style: ggTextStyle(20, FontWeight.bold, AppColor.white),
                    ),
                    onPressed: () {
                      linkUrl.openLink(url: baseUrl + '/api/sinhvien/export');
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColor.theme),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 40,
                  getWidthSize(context) * 0.05, 10),
              width: getWidthSize(context),
              child: Text(
                'Export danh sách điểm danh theo lớp',
                style: ggTextStyle(13, FontWeight.normal, AppColor.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 10,
                  getWidthSize(context) * 0.05, 10),
              width: getWidthSize(context),
              child: Text(
                'Tên lớp',
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
                hint: Text('Chọn lớp...'),
                items: departmentItemList.map((department) {
                  return DropdownMenuItem(
                    value: department['id'],
                    child: Text(department['ten_lop']),
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
              margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.06, 10,
                  getWidthSize(context) * 0.06, 10),
              width: getWidthSize(context),
              child: Container(
                  margin: EdgeInsets.fromLTRB(2, 10, 0, 0),
                  width: getWidthSize(context) * 0.86,
                  height: getHeightSize(context) * 0.06,
                  child: ElevatedButton(
                    child: Text(
                      'Export file danh sách điểm danh',
                      style: ggTextStyle(15, FontWeight.bold, AppColor.white),
                    ),
                    onPressed: () {
                      linkUrl.openLink(
                          url: baseUrl +
                              '/api/sinhvien/exportDiemDanh/' +
                              selectedValue!.toString());
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColor.theme),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                  )),
            ),
          ]),
        )));
  }
}
