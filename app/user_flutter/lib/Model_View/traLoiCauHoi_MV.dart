import 'dart:convert';

import 'package:user_flutter/Model/traLoiauHoi_M.dart';
import 'package:user_flutter/Model_View/login.dart';
import 'package:user_flutter/View/common/constant/string.dart';

import 'package:http/http.dart' as http;

class TraLoiCauHoi_MV {
  static Future<traLoiCauHoi_M?> getDsTraloi(int idbv) async {
    String url = getdstraloi;
    String token = await Login.getToken();
    Map body = {'id_bai_viet': idbv.toString()};
    final response = await http.post(Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json'
        },
        body: body);
    if (response.statusCode == 200) {
      final jsonResponse = traLoiCauHoi_M.fromJson(json.decode(response.body));
      try {
        return jsonResponse;
      } catch (e) {
        return null;
      }
    } else {
      return null;
    }
  }
}
