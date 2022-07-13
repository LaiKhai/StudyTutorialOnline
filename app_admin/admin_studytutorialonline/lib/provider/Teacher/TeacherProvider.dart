import 'dart:convert';
import 'package:admin_studytutorialonline/data/Teachers.dart';
import 'package:admin_studytutorialonline/data/model_duy/giangVien_model.dart';
import 'package:admin_studytutorialonline/page/Teacher/AD_TecherPage.dart';
import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/string.dart';
import '../../data/Teacher.dart';
import 'package:http/http.dart' as http;

import '../../data/User.dart';

class TeacherProvider {
  static Future<Teacher?> teacherDetail(BuildContext context, int id) async {
    String? token = await getToken();
    final response = await http
        .get(Uri.parse(detailTeacherObject + id.toString()), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token!}'
    });
    if (response.statusCode == 200) {
      var jsonData = Teacher.fromJson(json.decode(response.body));
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

  static Future<Teacher?> deleteTeacher(
      BuildContext context,
      String? id_khoa,
      String email,
      String password,
      String ma_so,
      String sdt,
      String ho_ten,
      String ngay_sinh,
      String id_chuc_vu,
      User us,
      int id) async {
    String? token = await getToken();
    Map body = {
      'id_khoa': id_khoa,
      'email': email,
      'password': password,
      'ho_ten': ho_ten,
      'ma_so': ma_so,
      'sdt': sdt,
      'ngay_sinh': ngay_sinh,
      'id_chuc_vu': id_chuc_vu,
      'trang_thai': "0"
    };
    String url = deleteTeacherObject + id.toString();
    var response = await http.put(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: body);
    if (response.statusCode == 200) {
      final jsonResponse = Teacher.fromJson(json.decode(response.body));
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Xóa tài khoản giảng viên thành công',
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
                              builder: (ctx) => TeacherPage(
                                    us: us,
                                  )),
                          (route) => false);
                    },
                    child: Text('Quay lại danh sách bộ môn',
                        style:
                            ggTextStyle(13, FontWeight.bold, AppColor.black)))
              ],
            );
          });
    } else if (response.statusCode == 500) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Lỗi máy chủ',
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
                              builder: (ctx) => TeacherPage(
                                    us: us,
                                  )),
                          (route) => false);
                    },
                    child: Text('Quay lại danh sách bộ môn',
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
              content: Text('Xóa tài khoản giảng viên thất bại',
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

  static Future<Teacher?> updateTeacher(
      BuildContext context,
      String? id_khoa,
      String email,
      String password,
      String ma_so,
      String sdt,
      String ho_ten,
      String ngay_sinh,
      String id_chuc_vu,
      User us,
      int id) async {
    String? token = await getToken();
    Map body = {
      'id_khoa': id_khoa,
      'email': email,
      'password': password,
      'ho_ten': ho_ten,
      'ma_so': ma_so,
      'sdt': sdt,
      'ngay_sinh': ngay_sinh,
      'id_chuc_vu': id_chuc_vu,
      'trang_thai': "1"
    };
    String url = deleteTeacherObject + id.toString();
    var response = await http.put(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: body);
    if (response.statusCode == 200) {
      final jsonResponse = Teacher.fromJson(json.decode(response.body));
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Chỉnh sửa tài khoản giảng viên thành công',
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
                              builder: (ctx) => TeacherPage(
                                    us: us,
                                  )),
                          (route) => false);
                    },
                    child: Text('Quay lại danh sách bộ môn',
                        style:
                            ggTextStyle(13, FontWeight.bold, AppColor.black)))
              ],
            );
          });
    } else if (response.statusCode == 500) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Lỗi máy chủ',
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
                              builder: (ctx) => TeacherPage(
                                    us: us,
                                  )),
                          (route) => false);
                    },
                    child: Text('Quay lại danh sách bộ môn',
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
              content: Text('Xóa tài khoản giảng viên thất bại',
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

  static Future<GiangViens_model?> getAllGiangVien() async {
    String? token = await getToken();
    final response = await http.get(Uri.parse(getallGiangVien), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token!}'
    });
    if (response.statusCode == 200) {
      final jsonresponse =
          GiangViens_model.fromJson(json.decode(response.body));
      return jsonresponse;
    } else
      return null;
  }

  static Future<Teacher?> createStudent(
      BuildContext context,
      String email,
      String password,
      String ma_so,
      String sdt,
      String ho_ten,
      String ngay_sinh,
      String id_chuc_vu,
      String id_khoa,
      User us) async {
    String? token = await getToken();
    Map body = {
      'email': email,
      'password': password,
      'ho_ten': ho_ten,
      'ma_so': ma_so,
      'sdt': sdt,
      'ngay_sinh': ngay_sinh,
      'id_chuc_vu': id_chuc_vu,
      'id_khoa': id_khoa,
    };
    String url = createGiangVien;
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: body);
    if (response.statusCode == 200) {
      final jsonResponse = Teacher.fromJson(json.decode(response.body));
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Tạo tài khoản giảng viên thành công',
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
                              builder: (ctx) => TeacherPage(
                                    us: us,
                                  )),
                          (route) => false);
                    },
                    child: Text('Quay lại danh sách giảng viên',
                        style:
                            ggTextStyle(13, FontWeight.bold, AppColor.black)))
              ],
            );
          });
    } else if (response.statusCode == 500) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Lỗi máy chủ',
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
                              builder: (ctx) => TeacherPage(
                                    us: us,
                                  )),
                          (route) => false);
                    },
                    child: Text('Quay lại danh sách giảng viên',
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
              content: Text('Tạo tài khoản giảng viên thất bại',
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
}
