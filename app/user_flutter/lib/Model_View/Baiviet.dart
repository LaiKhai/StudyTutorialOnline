import 'dart:convert';

import 'package:user_flutter/Model/bai_Viet.dart';
import 'package:user_flutter/Model_View/login.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import 'package:http/http.dart' as http;

class BaiViet{
 static Future<bai_Viet> getOneLopHP(int id_lopHp,String noidung) async {
    String url = postBaiviet;
    print(url);
    String token = await Login.getToken();
     Map body = {'id_lop_hoc_phan': id_lopHp, 'id_loai_bai_viet': 1,'noi_dung':noidung};
    final response = await http.post(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json'
    },body: body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      final jsonResponse = bai_Viet.fromJson(json.decode(response.body));
      try {
        return jsonResponse;
      } catch (e) {
        return new bai_Viet();
      }
    } else {
      return new bai_Viet();
    }
  }

}