import 'dart:convert';

import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/string.dart';
import '../../data/Student.dart';
import 'package:http/http.dart' as http;

class StudentProvider {
  static Future<Student?> subjectDetail(BuildContext context, int id) async {
    String? token = await getToken();
    final response = await http
        .get(Uri.parse(detailStudentObject + id.toString()), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token!}'
    });
    if (response.statusCode == 200) {
      var jsonData = Student.fromJson(json.decode(response.body)['user']);
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
