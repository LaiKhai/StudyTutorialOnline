import 'dart:convert';

import 'package:admin_studytutorialonline/data/Department.dart';
import 'package:admin_studytutorialonline/data/model_duy/Khoas_model.dart';
import 'package:admin_studytutorialonline/page/Department/AD_CreateDepartmentPage.dart';
import 'package:admin_studytutorialonline/page/Department/AD_DepartmentPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../common/contrains/color.dart';
import '../../common/contrains/string.dart';
import '../../data/User.dart';

class DepartmentProvider {
  static List<Department> parseObject(String reponseBody) {
    final parsed = jsonDecode(reponseBody)['khoa'].cast<Map<String, dynamic>>();
    return parsed.map<Department>((e) => Department.fromJson(e)).toList();
  }

  static Future<List<Department>> fetchObject() async {
    String? token = await getToken();
    final response = await http.get(Uri.parse(fetchDepartmentObject), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token!}'
    });
    return parseObject(response.body);
  }

  static Future<void> createDepartment(
      BuildContext context, String tenkhoa, User us) async {
    String? token = await getToken();
    String url = createDepartmentUrl;
    Map body = {
      'ten_khoa': tenkhoa,
    };
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: body);
    if (response.statusCode == 200) {
      final jsonResponse =
          Department.fromJson(json.decode(response.body)['khoa']);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Thêm khoa thành công',
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
                              builder: (ctx) => DepartmentPage(us: us)),
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
              content: Text('Thêm khoa thất bại!',
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

  static Future<void> deletedepartment(
      BuildContext context, String tenkhoa, User us, int id) async {
    String? token = await getToken();
    Map body = {'ten_khoa': tenkhoa, 'trang_thai': "0"};
    String url = deleteDepartment + id.toString();
    var response = await http.put(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: body);
    if (response.statusCode == 200) {
      final jsonResponse =
          Department.fromJson(json.decode(response.body)['khoa']);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Xóa khoa thành công',
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
                              builder: (ctx) => DepartmentPage(
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
              content: Text('Xóa khoa thất bại',
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

  static Future<Department?> departmentDetail(
      BuildContext context, int id) async {
    String? token = await getToken();
    final response = await http.get(Uri.parse(detailDepartment + id.toString()),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        });
    if (response.statusCode == 200) {
      var jsonData = Department.fromJson(json.decode(response.body)['khoa']);
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

  static Future<void> updateDepartment(
      BuildContext context, String tenkhoa, User us, int id) async {
    String? token = await getToken();
    Map body = {'ten_khoa': tenkhoa, 'trang_thai': "1"};
    String url = deleteDepartment + id.toString();
    var response = await http.put(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: body);
    if (response.statusCode == 200) {
      final jsonResponse =
          Department.fromJson(json.decode(response.body)['khoa']);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Chỉnh sửa khoa thành công',
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
                              builder: (ctx) => DepartmentPage(
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
              content: Text('Chỉnh sửa khoa thất bại',
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

  static Future<Khoas> getAllKhoa() async {
    String? token = await getToken();
    final response = await http.get(Uri.parse(fetchDepartmentObject), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token!}'
    });
    if (response.statusCode == 200) {
      final jsonresponse = Khoas.fromJson(json.decode(response.body));
      return jsonresponse;
    } else {
      return new Khoas();
    }
  }
}
