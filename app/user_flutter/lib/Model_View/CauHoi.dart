import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_flutter/Model/User_login.dart';
import 'package:user_flutter/Model/createBktra.dart';
import 'package:user_flutter/Model/tao_CauHoi.dart';
import 'package:user_flutter/Model/test.dart';
import 'package:user_flutter/Model_View/bai_Ktra.dart';
import 'package:user_flutter/Model_View/login.dart';
import 'package:user_flutter/View/Widget/showNouti.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import 'package:http/http.dart' as http;
import 'package:user_flutter/View/page/subject_view.dart';

class CauHoi {
  static Future<int> guiFile(File img) async {
    String token = await Login.getToken();
    String url = urlGuifile;
    Dio dio = new Dio();
    FormData formData;
    img.existsSync();
    final file = MultipartFile.fromFile(img.path);
    formData = new FormData.fromMap({'file': await file});
    final response = await dio.post(url,
        data: formData,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.data);
      var idfile = map["file"];
      print(idfile);
      return idfile;
    } else {
      print(0);
      return 0;
    }
  }

  static Future<bool> taoCauHoi(Cauhoi_Ktra lst_cauHoi, BuildContext context,
      int id, Crate_Bktra bktra) async {
    String token = await Login.getToken();
    var jsonString = jsonEncode(lst_cauHoi.toJson());
    print(jsonString);
    String url = postCauHoi;
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonString);
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      showCustomDialog(context, 'Tạo bài thành công', true);
      BaiKiemTraVM.Update_BKTra(
          bktra.baikiemtra!.id!,
          id,
          user.user!.id!,
          bktra.baikiemtra!.noiDung!,
          lst_cauHoi.listCauHoi!.length,
          DateTime.now().toString(),
          '',
          '2');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => SubjectView(
                    id_lopHp: id,
                  )),
          (route) => false);
      return true;
    } else {
      print('2');
      return false;
    }
  }
}
