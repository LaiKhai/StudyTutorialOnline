import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:admin_studytutorialonline/data/model_duy/Class_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../data/Department.dart';

class ClassPartProvider {
  static List<Department> parseObject(String reponseBody) {
    final parsed = jsonDecode(reponseBody)['khoa'].cast<Map<String, dynamic>>();
    return parsed;
  }

  static Future<List<Department>> fetchObject() async {
    String? token = await getToken();
    final response = await http.get(Uri.parse(fetchDepartmentObject), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token!}'
    });
    return parseObject(response.body);
  }

  static Future<bool> postClass(
      BuildContext context, String idgv, String tenLop, String nienKhoa) async {
    String? token = await getToken();
    String url = fetchClassObject;
    Map body = {
      'id_giangvien': idgv,
      'ten_lop': tenLop,
      'nien_khoa': nienKhoa,
    };
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: body);
    print(jsonDecode(response.body)['status'].toString());
    final parsed = jsonDecode(response.body)['status'];
    if (parsed == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Tạo lớp thành công!',
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
      //Đặt cái di chuyển về màng hình danh sách lớp
      return true;
    } else {
      print('có lổi xảy ra');
      return false;
    }
  }

  static Future<ClassModel?> getOneClass(int id) async {
    String? token = await getToken();
    final response = await http.get(Uri.parse(updateclasses + id.toString()),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        });
    try {
      final jsonrespone = ClassModel.fromJson(json.decode(response.body));
      return jsonrespone;
    } catch (e) {
      return new ClassModel();
    }
  }
}
