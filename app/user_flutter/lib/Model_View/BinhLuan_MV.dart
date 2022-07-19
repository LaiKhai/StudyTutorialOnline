import 'dart:convert';

import 'package:user_flutter/Model/Binhluan_model.dart';
import 'package:user_flutter/Model_View/login.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import 'package:http/http.dart' as http;

class BinhLuan_MV {
  static Future<bool> postBinhLuan(
      String idBaiviet, String idSinhVien, String noiDung) async {
    String token = await Login.getToken();

    String url = urlBinhLuan;
    Map body = {
      "id_bai_viet": idBaiviet.toString(),
      "id_sinh_vien": idSinhVien.toString(),
      "id_bai_tap": "",
      "noi_dung": noiDung
    };
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<BinhLuansM?> getBinhLuan(String idBaiviet) async {
    String token = await Login.getToken();

    String url = urlgetBinhLuan;
    Map body = {
      "id_bai_viet": idBaiviet.toString(),
    };
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);
    print(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = BinhLuansM.fromJson(json.decode(response.body));
      return jsonResponse;
    } else {
      print('status khác 200');
      return null;
    }
  }
}
