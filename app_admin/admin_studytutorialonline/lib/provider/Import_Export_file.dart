import 'dart:convert';
import 'dart:io';

import 'package:StudyTutorialOnlineAdmin/data/Student.dart';
import 'package:StudyTutorialOnlineAdmin/page/AD_ImportExportDSSV.dart';
import 'package:StudyTutorialOnlineAdmin/page/Student/AD_StudentPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../common/contrains/color.dart';
import '../common/contrains/string.dart';
import '../data/User.dart';

class Import_Export {
  static Future<void> import(BuildContext context, File file, User us) async {
    String? token = await getToken();
    Dio dio = new Dio();
    FormData formData;
    String filename = basename(file.path);
    formData = FormData.fromMap(
        {'file': await MultipartFile.fromFile(file.path, filename: filename)});
    String url = importFile;
    final response = await dio.post(url,
        data: formData,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Thêm danh sách sinh viên thành công ',
                  style: ggTextStyle(13, FontWeight.bold, AppColor.black)),
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
                      style: ggTextStyle(13, FontWeight.bold, AppColor.black))
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => StudentPage(us: us)),
                          (route) => false);
                    },
                    child: Text('Quay lại',
                        style:
                            ggTextStyle(13, FontWeight.bold, AppColor.black)))
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Thêm danh sách sinh viên thất bại !',
                  style: ggTextStyle(13, FontWeight.bold, AppColor.black)),
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
                      style: ggTextStyle(13, FontWeight.bold, AppColor.black))
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK',
                        style:
                            ggTextStyle(13, FontWeight.bold, AppColor.black)))
              ],
            );
          });
    }
  }
}
