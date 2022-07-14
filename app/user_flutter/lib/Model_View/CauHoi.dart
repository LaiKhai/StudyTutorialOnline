import 'dart:convert';

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
  static Future<bool> taoCauHoi(Cauhoi_Ktra lst_cauHoi, BuildContext context,
      int id, Crate_Bktra bktra) async {
    String token = await Login.getToken();
    var jsonString = jsonEncode(lst_cauHoi.toJson());
    String url = postCauHoi;
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonString);
    if (response.statusCode == 200) {
      print(response.body);
      showCustomDialog(context, 'Tạo bài thành công', true);
      BaiKiemTraVM.Update_BKTra(bktra.baikiemtra!.id!,id, user.user!.id!, bktra.baikiemtra!.noiDung!,
          lst_cauHoi.listCauHoi!.length,'2');
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
