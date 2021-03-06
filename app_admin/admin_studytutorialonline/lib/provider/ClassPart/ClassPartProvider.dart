import 'dart:io';

import 'package:StudyTutorialOnlineAdmin/common/contrains/string.dart';
import 'package:StudyTutorialOnlineAdmin/data/ClassPart.dart';
import 'package:StudyTutorialOnlineAdmin/data/ClassPartCreate.dart';
import 'package:StudyTutorialOnlineAdmin/page/ClassPart/AD_ClassPart.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'dart:convert';

import '../../common/contrains/color.dart';
import '../../data/Department.dart';
import '../../data/User.dart';

class ClassPartProvider {
  static List<Department> parseObject(String reponseBody) {
    final parsed =
        jsonDecode(reponseBody)['lớp học phần'].cast<Map<String, dynamic>>();
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

  static Future<void> createClassPart(BuildContext context, File imgClassPart,
      String id_bo_mon, String id_lop, User us) async {
    String? token = await getToken();
    Dio dio = new Dio();
    FormData formData;
    String filename = basename(imgClassPart.path);
    formData = FormData.fromMap({
      'id_bo_mon': id_bo_mon.toString(),
      'id_lop': id_lop.toString(),
      'trang_thai': "1",
      'avt': await MultipartFile.fromFile(imgClassPart.path)
    });
    String url = createClassPartObject;

    final response = await dio.post(url,
        data: formData,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    // Map body = {
    //   'id_bo_mon': id_bo_mon,
    //   'id_lop': id_lop,
    //   'trang_thai': "1",
    //   'avt': imgClassPart
    // };
    // var response = await http.post(Uri.parse(url),
    //     headers: <String, String>{
    //       'Accept': 'application/json',
    //       'Authorization': 'Bearer ${token!}'
    //     },
    //     body: body);
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Thêm lớp học phần thành công',
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
                              builder: (ctx) => ClassPartPage(us: us)),
                          (route) => false);
                    },
                    child: Text('Quay lại danh sách lớp học phần',
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
              content: Text('Thêm lớp học phần thất bại!',
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

  static Future<ClassPart?> classpartDetail(
      BuildContext context, int id) async {
    String? token = await getToken();
    final response = await http.get(Uri.parse(classPartDetail + id.toString()),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        });
    if (response.statusCode == 200) {
      var jsonData = ClassPart.fromJson(json.decode(response.body));
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

  static Future<void> updateClassPart(BuildContext context, String imgClassPart,
      String id_bo_mon, String id_lop, User us, int id) async {
    String? token = await getToken();
    Map body = {
      'id_bo_mon': id_bo_mon.toString(),
      'id_lop': id_lop.toString(),
      'trang_thai': "1",
      'avt': imgClassPart,
    };
    String url = updateClassPartObject + id.toString();
    var response = await http.put(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: body);
    var check = jsonDecode(response.body)['status'];
    if (check == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Chỉnh sửa lớp học phần thành công',
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
                              builder: (ctx) => ClassPartPage(
                                    us: us,
                                  )),
                          (route) => false);
                    },
                    child: Text('Quay lại danh sách lớp học phần',
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
              content: Text('Chỉnh sửa lớp học phần thất bại',
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

  // static Future<void> updateClassPart(BuildContext context, File imgClassPart,
  //     String id_bo_mon, String id_lop, User us, int id) async {
  //   String? token = await getToken();
  //   String url = updateClassPartObject + id.toString();
  //   Dio dio = new Dio();
  //   var formData;
  //   String filename = basename(imgClassPart.path);
  //   formData = FormData.fromMap({
  //     'id_bo_mon': id_bo_mon.toString(),
  //     'id_lop': id_lop.toString(),
  //     'trang_thai': "1",
  //     'avt': await MultipartFile.fromFile(imgClassPart.path)
  //   });

  //   final response =
  //       await dio.post(url, data: {}, options: Options(headers: formData));
  //   if (response.statusCode == 200) {
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             content: Text('Chỉnh sửa lớp học phần thành công',
  //                 style: ggTextStyle(13, FontWeight.bold, AppColor.black)),
  //             title: Row(
  //               children: [
  //                 Icon(
  //                   Icons.warning_rounded,
  //                   color: AppColor.theme,
  //                 ),
  //                 SizedBox(
  //                   width: 10,
  //                 ),
  //                 Text('Thông báo',
  //                     style: ggTextStyle(13, FontWeight.bold, AppColor.black))
  //               ],
  //             ),
  //             actions: [
  //               TextButton(
  //                   onPressed: () {
  //                     Navigator.pushAndRemoveUntil(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (ctx) => ClassPartPage(us: us)),
  //                         (route) => false);
  //                   },
  //                   child: Text('Quay lại danh sách lớp học phần',
  //                       style:
  //                           ggTextStyle(13, FontWeight.bold, AppColor.black)))
  //             ],
  //           );
  //         });
  //   } else {
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             content: Text('Chỉnh sửa lớp học phần thất bại!',
  //                 style: ggTextStyle(13, FontWeight.bold, AppColor.black)),
  //             title: Row(
  //               children: [
  //                 Icon(
  //                   Icons.warning_rounded,
  //                   color: AppColor.theme,
  //                 ),
  //                 SizedBox(
  //                   width: 10,
  //                 ),
  //                 Text('Thông báo',
  //                     style: ggTextStyle(13, FontWeight.bold, AppColor.black))
  //               ],
  //             ),
  //             actions: [
  //               TextButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: Text('OK',
  //                       style:
  //                           ggTextStyle(13, FontWeight.bold, AppColor.black)))
  //             ],
  //           );
  //         });
  //   }
  // }

  static Future<void> deleteClassPart(BuildContext context, String imgClassPart,
      String id_bo_mon, String id_lop, User us, int id) async {
    String? token = await getToken();
    String url = updateClassPartObject + id.toString();
    Map body = {
      'id_bo_mon': id_bo_mon,
      'id_lop': id_lop,
      'trang_thai': "0",
      'avt': imgClassPart
    };
    var response = await http.put(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: body);
    if (response.statusCode == 200) {
      final jsonResponse = ClassPart.fromJson(json.decode(response.body));
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Xóa lớp học phần thành công',
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
                              builder: (ctx) => ClassPartPage(us: us)),
                          (route) => false);
                    },
                    child: Text('Quay lại danh sách lớp học phần',
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
              content: Text('Xóa lớp học phần thất bại!',
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
