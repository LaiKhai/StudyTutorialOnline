import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:user_flutter/Model/User_login.dart';
import 'package:user_flutter/Model/bai_Viet.dart';
import 'package:user_flutter/Model_View/login.dart';
import 'package:user_flutter/View/Widget/showNouti.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import 'package:http/http.dart' as http;
import 'package:user_flutter/View/page/subject_view.dart';

class BaiViet {
  static Future<baiViets> getAllBaiViet() async {
    String url = postBaiviet;
    String token = await Login.getToken();
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      print(response.body);
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

  static Future<bool> postBaiViet(
      int id_lopHp, String noidung, BuildContext context) async {
    String url = postBaiviet;
    print(url);
    String token = await Login.getToken();
    Map body;
    if (user.user!.idChucVu == 0) {
      body = {
        'id_lop_hoc_phan': id_lopHp.toString(),
        'id_loai_bai_viet': '1',
        'id_sinh_vien': user.user!.id.toString(),
        'id_giang_vien': '',
        'noi_dung': noidung
      };
    } else {
      body = {
        'id_lop_hoc_phan': id_lopHp.toString(),
        'id_loai_bai_viet': '1',
        'id_sinh_vien': '',
        'id_giang_vien': user.user!.id.toString(),
        'noi_dung': noidung
      };
    }

    final response = await http.post(Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json'
        },
        body: body);
    print('ta tus' + response.statusCode.toString());
    if (response.statusCode == 200) {
      print(response.body);
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
