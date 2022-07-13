import 'dart:convert';

import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:admin_studytutorialonline/data/ClassRoom.dart';
import 'package:admin_studytutorialonline/page/AD_Class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../data/User.dart';
import '../../data/model_duy/Class_model.dart';

class ClassRoomProvider {
  static List<ClassRoom> parseObject(String reponseBody) {
    final parsed = jsonDecode(reponseBody)['lop'].cast<Map<String, dynamic>>();
    return parsed.map<ClassRoom>((e) => ClassRoom.fromJson(e)).toList();
  }

  static Future<List<ClassRoom>> fetchObject() async {
    String? token = await getToken();
    final response = await http.get(Uri.parse(fetchClassObject), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token!}'
    });
    return parseObject(response.body);
  }

  static Future<bool> updateClass(
      BuildContext context,
      String idClass,
      String idGV,
      String tenLop,
      String nienKhoa,
      String trangThai,
      User us) async {
    print('urlssidGV ' + idGV.toString());
    print('urlsstenLop ' + tenLop.toString());
    print('urlssnienKhoa ' + nienKhoa.toString());
    print('urlsstrangThai ' + trangThai.toString());
    String? token = await getToken();
    Map Body = {
      'id_giangvien': idGV.toString(),
      'ten_lop': tenLop.toString(),
      'nien_khoa': nienKhoa,
      'trang_thai': trangThai
    };
    final response = await http.put(Uri.parse('$updateclasses$idClass'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: Body);
    final parsed = jsonDecode(response.body)['status'];
    if (parsed == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: trangThai == '1'
                  ? Text('Sửa lớp thành công!',
                      style: ggTextStyle(13, FontWeight.bold, AppColor.black))
                  : Text('Xoá lớp thành công!',
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => ClassPage(us: us)));
                    },
                    child: Text('OK',
                        style:
                            ggTextStyle(13, FontWeight.bold, AppColor.black)))
              ],
            );
          });
    }
    return true;
  }

  static Future<bool> postClass(BuildContext context, String idgv,
      String tenLop, String nienKhoa, User us) async {
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => ClassPage(us: us)));
                    },
                    child: Text('OK',
                        style:
                            ggTextStyle(13, FontWeight.bold, AppColor.black)))
              ],
            );
          });

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
