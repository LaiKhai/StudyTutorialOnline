import 'dart:convert';

import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:admin_studytutorialonline/data/Subject.dart';
import 'package:admin_studytutorialonline/page/Subject/AD_SubjectPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../common/contrains/color.dart';
import '../../data/User.dart';

class SubjectProvider {
  static Future<void> createSubject(BuildContext context, String id_khoa,
      String ten_mon_hoc, String loai_mon_hoc, User us) async {
    String? token = await getToken();
    Map body = {
      'id_khoa': id_khoa,
      'ten_mon_hoc': ten_mon_hoc,
      'loai_mon_hoc': loai_mon_hoc
    };
    String url = createSubjectObject;
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: body);
    if (response.statusCode == 200) {
      final jsonResponse =
          Subject.fromJson(json.decode(response.body)['bomon']);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Thêm bộ môn thành công',
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
                              builder: (ctx) => SubjectPage(
                                    us: us,
                                  )),
                          (route) => false);
                    },
                    child: Text('Quay lại danh sách khoa',
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
              content: Text('Thêm bộ môn thất bại',
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
                    child: Text('Quay lại ',
                        style:
                            ggTextStyle(13, FontWeight.bold, AppColor.black)))
              ],
            );
          });
    }
  }

  static Future<Subject?> subjectDetail(BuildContext context, int id) async {
    String? token = await getToken();
    final response = await http
        .get(Uri.parse(detailSubjectObject + id.toString()), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token!}'
    });
    if (response.statusCode == 200) {
      var jsonData = Subject.fromJson(json.decode(response.body)['bomon']);
      return jsonData;
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Có lỗi xảy ra !',
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
                    child: Text('Quay lại',
                        style:
                            ggTextStyle(13, FontWeight.bold, AppColor.black)))
              ],
            );
          });
    }
    return null;
  }
}
