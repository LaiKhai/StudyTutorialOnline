// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:user_flutter/Model/BaiKtrta.dart';
import 'package:user_flutter/Model/createBktra.dart';
import 'package:user_flutter/Model/listBaiKtra_model.dart';
import 'package:user_flutter/Model_View/login.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import 'package:user_flutter/View/page/Form_tao_Bktra.dart';

class BaiKiemTraVM {
  static Future<List_Ktra_model> Get_BKTra(int id_lop) async {
    String url = getBaiktra + id_lop.toString();
    String token = await Login.getToken();
    Map body = {'trang_thai': '1'};
    print(url);
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);
    print(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = List_Ktra_model.fromJson(json.decode(response.body));
      try {
        return jsonResponse;
      } catch (e) {
        return new List_Ktra_model();
      }
    } else {
      return new List_Ktra_model();
    }
  }

  static Future<CT_Bai_Ktra_model> Show_BKTra(int id_bkta) async {
    String url = urlBaiktra + id_bkta.toString();
    String token = await Login.getToken();

    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      final jsonResponse =
          CT_Bai_Ktra_model.fromJson(json.decode(response.body));
      try {
        return jsonResponse;
      } catch (e) {
        return new CT_Bai_Ktra_model();
      }
    } else {
      return new CT_Bai_Ktra_model();
    }
  }

  static Future<bool> Create_BKTra(String tieuDe, String noiDung, int idLop,
      int soLuong, int Diem, int idGvien, BuildContext context) async {
    String url = postBktra;
    String token = await Login.getToken();
    Map formData;
    // ignore: unnecessary_new
    formData = {
      "tg_ket_thuc": DateTime.now().toString(),
      "id_lop_hoc_phan": idLop.toString(),
      "sl_cau_hoi": soLuong.toString(),
      "id_giang_vien": idGvien.toString(),
      "tieu_de": tieuDe,
      "noi_dung": noiDung,
      "trang_thai": '0'
    };
    final response = await http.post(Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json'
        },
        body: formData);
    print(response.statusCode);
    if (response.statusCode == 200) {
      TextEditingController tieuDeController =
          new TextEditingController(text: tieuDe);
// ignore: unnecessary_new
      TextEditingController soCauhoiController =
          new TextEditingController(text: soLuong.toString());
// ignore: unnecessary_new
      TextEditingController huongDanController =
          new TextEditingController(text: noiDung);
// ignore: unnecessary_new
      TextEditingController diemToiDaController =
          new TextEditingController(text: Diem.toString());
      final jsonResponse =
          Crate_Bktra.fromJson(json.decode(response.body.toString()));
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Tao_trac_nghiem(
                  bktra: jsonResponse,
                  TieuDeController: tieuDeController,
                  MoTaController: huongDanController,
                  SoLuong: soLuong,
                  diemToiDaController: diemToiDaController,
                )),
      );

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> Update_BKTra(
      int id_lop, int id_gv, String noiDung, int tong) async {
    String url = urlBaiktra;
    String token = await Login.getToken();
    Map body = {
      "id_lop_hoc_phan": id_lop.toString(),
      "id_giang_vien": id_gv.toString(),
      "sl_cau_hoi": tong.toString(),
      "noi_dung": noiDung.toString(),
      "tg_bat_dau": DateTime.now().toString(),
      "tg_ket_thuc": DateTime.now().toString(),
      "trang_thai": 1.toString()
    };
    var response = await http.patch(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> posts = map["status"];
    print(posts);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> traLoiMotCau(String dap_an, int id_cau_hoi,
      int id_bai_viet, int id_cau_tra_loi) async {
    String url = postTraLoi;
    String token = await Login.getToken();
    Map body = {
      "dap_an": dap_an.toString(),
      "id_cau_hoi": id_cau_hoi.toString(),
      "id_bai_kiem_tra": id_bai_viet.toString(),
      "id_cau_tra_loi": id_cau_tra_loi.toString(),
    };
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> posts = map["status"];
    print(posts);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
