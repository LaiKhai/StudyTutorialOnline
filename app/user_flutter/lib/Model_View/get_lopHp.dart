import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_flutter/Model/User_login.dart';
import 'package:user_flutter/Model/cTiet_LopHP.dart';
import 'package:user_flutter/Model/lop_HP.dart';
import 'package:user_flutter/Model_View/login.dart';
import 'package:http/http.dart' as http;
import 'package:user_flutter/View/common/constant/string.dart';

class LopHocPhan {
  static Future<lop_HP> getLopHP() async {
    try {
      String url;
      if (user.user!.idChucVu == 0) {
        url = getClass + user.user!.id!.toString();
      } else {
        url = getClassGV + user.user!.id!.toString();
      }
      String token = await Login.getToken();
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final SharedPreferences sharedPref =
            await SharedPreferences.getInstance();
        sharedPref.setString('ds_LopHocPhan', response.body);
        final jsonResponse = lop_HP.fromJson(json.decode(response.body));
        try {
          return jsonResponse;
        } catch (e) {
          return new lop_HP();
        }
      } else {
        return new lop_HP();
      }
    } catch (e) {
      final SharedPreferences sharedPref =
          await SharedPreferences.getInstance();
      String? ls_LopHocPhan = sharedPref.getString('ds_LopHocPhan');
      final jsonResponses;
      if (ls_LopHocPhan != null) {
        jsonResponses = lop_HP.fromJson(json.decode(ls_LopHocPhan));
      } else {
        jsonResponses = new lop_HP();
      }
      return jsonResponses;
    }
  }

  static Future<Ctiet_lopHP> getOneLopHP(int id_lop) async {
    String url = getOneClass + id_lop.toString();
    String token = await Login.getToken();
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json'
    });
    if (response.statusCode == 200) {
      final jsonResponse = Ctiet_lopHP.fromJson(json.decode(response.body));
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
