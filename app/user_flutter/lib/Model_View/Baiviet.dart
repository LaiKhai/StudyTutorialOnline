// ignore_for_file: await_only_futures

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:user_flutter/Model/User_login.dart';
import 'package:user_flutter/Model/bai_Viet.dart';
import 'package:user_flutter/Model_View/login.dart';
import 'package:user_flutter/View/Widget/showNouti.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import 'package:http/http.dart' as http;
import 'package:user_flutter/View/controller/tao_bai.dart';
import 'package:user_flutter/View/page/subject_view.dart';

class BaiViet {
  static Future<baiViets> getAllBaiViet(int id) async {
    String url = getListwithclass + id.toString();
    String token = await Login.getToken();
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      final jsonResponse = baiViets.fromJson(json.decode(response.body));
      try {
        return jsonResponse;
      } catch (e) {
        return new baiViets();
      }
    } else {
      return new baiViets();
    }
  }

  static Future<bool> postBaiViet(int id_lopHp, String noidung,
      BuildContext context, int loaiThongBao) async {
    Dio dio = new Dio();
    var lst = [];
    if (listFile.length == 0) {
      showCustomDialog(context, 'Đăng bài thất bại', false);
      return false;
    }
    if (listFile.length != 0) {
      for (var img in listFile) {
        img.existsSync();
        lst.add(await MultipartFile.fromFile(img.path));
      }
    }
    ;
    String url = postBaiviet;
    String token = await Login.getToken();
    Map body;
    FormData formData;
    if (user.user!.idChucVu == 0) {
      // ignore: unnecessary_new, unused_local_variable
      formData = new FormData.fromMap({
        'id_lop_hoc_phan': id_lopHp.toString(),
        'id_loai_bai_viet': loaiThongBao.toString(),
        'id_sinh_vien': user.user!.id.toString(),
        'id_giang_vien': '',
        'noi_dung': noidung,
        'file[]': await lst
      });
    } else {
      // ignore: unnecessary_new
      formData = new FormData.fromMap({
        'id_lop_hoc_phan': id_lopHp.toString(),
        'id_loai_bai_viet': loaiThongBao.toString(),
        'id_sinh_vien': '',
        'id_giang_vien': user.user!.id.toString(),
        'noi_dung': noidung,
        'file[]': await lst
      });
    }
    listFile.clear();
    final response = await dio.post(url,
        data: formData,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    if (response.statusCode == 200) {
      showCustomDialog(context, 'Đăng bài thành công', true);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => SubjectView(
                    id_lopHp: id_lopHp,
                  )),
          (route) => false);
      return true;
    } else {
      showCustomDialog(context, 'Đăng bài thất bại', false);
      return false;
    }
  }
}
