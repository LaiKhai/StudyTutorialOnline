import 'dart:convert';

import 'package:user_flutter/Model/User_login.dart';
import 'package:user_flutter/Model/cTiet_LopHP.dart';
import 'package:user_flutter/Model/lop_HP.dart';
import 'package:user_flutter/Model_View/login.dart';
import 'package:http/http.dart' as http;
import 'package:user_flutter/View/common/constant/string.dart';

class LopHocPhan {
  static Future<lop_HP> getLopHP() async {
    String url;
    if (user.user!.idChucVu == 0) {
      url = getClass + user.user!.id!.toString();
    } else {
      url = getClassGV + user.user!.id!.toString();
    }

    print(url);
    String token = await Login.getToken();
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json'
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      final jsonResponse = lop_HP.fromJson(json.decode(response.body));
      print(jsonResponse.lophocphan![0].tenMonHoc);
      try {
        return jsonResponse;
      } catch (e) {
        return new lop_HP();
      }
    } else {
      return new lop_HP();
    }
  }

  static Future<Ctiet_lopHP> getOneLopHP(int id_lop) async {
    String url = getOneClass + id_lop.toString();
    print(url);
    String token = await Login.getToken();
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json'
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      final jsonResponse = Ctiet_lopHP.fromJson(json.decode(response.body));
      print(jsonResponse.lophocphan!.bomon!.tenMonHoc);
      try {
        return jsonResponse;
      } catch (e) {
        return new Ctiet_lopHP();
      }
    } else {
      return new Ctiet_lopHP();
    }
  }
}
