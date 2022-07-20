import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:user_flutter/Model/ThongKeM.dart';
import 'package:user_flutter/Model_View/login.dart';
import 'package:user_flutter/View/common/constant/string.dart';

class ThongKeMV {
  static Future<ThongKeM?> getThongKe(int id) async {
    try {
      String url = urlThongKe;
      String token = await Login.getToken();
      Map body = {'id_bai_kiem_tra': id.toString()};
      final response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json'
          },
          body: body);
      if (response.statusCode == 200) {
        final SharedPreferences sharedPref =
            await SharedPreferences.getInstance();
        final jsonResponse = ThongKeM.fromJson(json.decode(response.body));
        try {
          return jsonResponse;
        } catch (e) {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

}
