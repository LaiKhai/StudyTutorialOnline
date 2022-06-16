import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_flutter/Model/sinhVien.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/page/NaviGa.dart';

import '../View/common/constant/string.dart';
import 'package:http/http.dart' as http;

// Author: Lai Hong Khai
// Date: 08/06/2022

class Login {
  //--------------------------- Lấy token ------------------------------------//
  Future<String> getToken() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString('token');
    if (token == null) return '';
    return token;
  }

//--------------------------- Đăng Nhập Sinh Viên ------------------------------------//
  Future<void> login(
      String email, String password, BuildContext context) async {
    String url = urlLoginSinhVien;
    Map body = {'email': email, 'password': password};

    var response = await http.post(Uri.parse(url),
        headers: <String, String>{'Accept': 'application/json'}, body: body);

    if (response.statusCode == 200) {
      final jsonResponse = SinhVien.fromJson(json.decode(response.body));
      final SharedPreferences sharedPref =
          await SharedPreferences.getInstance();
      sharedPref.setString('token', jsonResponse.token);
      Future<String?> token = Login().getToken();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Navigator_page()),
          (route) => false);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                'Kiểm tra lại email hoặc password !',
                style: ggTextStyle(
                    16, FontWeight.normal, AppColor.black),
              ),
              title: Row(
                children: [
                  Icon(
                    Icons.warning_rounded,
                    color: AppColor.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Thông báo',
                      style: ggTextStyle(
                          15, FontWeight.bold, AppColor.green))
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'OK',
                      style: ggTextStyle(
                          15, FontWeight.bold, AppColor.green),
                    ))
              ],
            );
          });
    }
  }
}
