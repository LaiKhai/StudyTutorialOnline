import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_flutter/Model/Gianvien.dart';
import 'package:user_flutter/Model/User_login.dart';
import 'package:user_flutter/Model/sinhVien.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/page/NaviGa.dart';

import '../View/common/constant/string.dart';
import 'package:http/http.dart' as http;

// Author: Lai Hong Khai
// Date: 08/06/2022

class Login {
  //--------------------------- Lấy token ------------------------------------//
  static Future<String> getToken() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString('token');
    if (token == null) return '';
    return token;
  }

  static Future<User_login> getUs() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? user_login = sharedPref.getString('user_login');

    final us = User_login.fromJson(json.decode(user_login!));
    user = us;
    return us;
  }

//--------------------------- Đăng Nhập Sinh Viên ------------------------------------//
  Future<User_login> login(String email, String password, BuildContext context,
      bool giangVien) async {
    String url = urlLogin;

    Map body = {'email': email, 'password': password};

    var response = await http.post(Uri.parse(url),
        headers: <String, String>{'Accept': 'application/json'}, body: body);

    if (response.statusCode == 200) {
      final jsonResponse = User_login.fromJson(json.decode(response.body));

      final SharedPreferences sharedPref =
          await SharedPreferences.getInstance();
      sharedPref.setString('token', jsonResponse.token!);
      sharedPref.setString('user_login', response.body);

      Future<String?> token = Login.getToken();

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Navigator_page()),
          (route) => false);
      return jsonResponse;
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                'Kiểm tra lại email hoặc password !',
                style: ggTextStyle(16, FontWeight.normal, AppColor.black),
              ),
              title: Row(
                children: [
                  const Icon(
                    Icons.warning_rounded,
                    color: AppColor.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Thông báo',
                      style: ggTextStyle(15, FontWeight.bold, AppColor.green))
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'OK',
                      style: ggTextStyle(15, FontWeight.bold, AppColor.green),
                    ))
              ],
            );
          });
      return new User_login();
    }
  }
}
