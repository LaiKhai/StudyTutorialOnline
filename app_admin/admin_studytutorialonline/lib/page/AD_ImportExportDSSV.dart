import 'dart:io';

import 'package:StudyTutorialOnlineAdmin/provider/Import_Export_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';
import '../data/User.dart';

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
                'Import/ Export DSSV',
                style: ggTextStyle(30, FontWeight.bold, AppColor.theme),
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
              height: 100,
              width: getWidthSize(context),
              child: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  height: 300,
                  width: getWidthSize(context),
                  child: Center(
                      child: Text(imgClassPart != null
                          ? imgClassPart.toString()
                          : 'hiện tại chưa có file nào')),
                ),
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
                      'Thêm file danh sách',
                      style: ggTextStyle(20, FontWeight.bold, AppColor.white),
                    ),
                    onPressed: () {
                      imgClassPart = null;
                      chonAnh();
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
              margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.06, 10,
                  getWidthSize(context) * 0.06, 10),
              width: getWidthSize(context),
              child: Container(
                  margin: EdgeInsets.fromLTRB(2, 10, 0, 0),
                  width: getWidthSize(context) * 0.86,
                  height: getHeightSize(context) * 0.06,
                  child: ElevatedButton(
                    child: Text(
                      'Import file danh sách',
                      style: ggTextStyle(20, FontWeight.bold, AppColor.white),
                    ),
                    onPressed: () {
                      if (imgClassPart != null) {
                        Import_Export.import(context, imgClassPart!, us);
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text('Bạn chưa thêm file nào !',
                                    style: ggTextStyle(
                                        13, FontWeight.bold, AppColor.black)),
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
                                        style: ggTextStyle(13, FontWeight.bold,
                                            AppColor.black))
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('OK',
                                          style: ggTextStyle(13,
                                              FontWeight.bold, AppColor.black)))
                                ],
                              );
                            });
                      }
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
