// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:user_flutter/Model/BaiKiemTraSVModel.dart';
import 'package:user_flutter/Model/BaiKtrta.dart';
import 'package:user_flutter/Model/Bai_da_luu.dart';
import 'package:user_flutter/Model/SinhVienLamKtraM.dart';
import 'package:user_flutter/Model/User_login.dart';
import 'package:user_flutter/Model/createBktra.dart';
import 'package:user_flutter/Model/listBaiKtra_model.dart';
import 'package:user_flutter/Model_View/login.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import 'package:user_flutter/View/page/Form_tao_Bktra.dart';

class BaiKiemTraVM {
  static Future<List_Ktra_model> Get_BKTra(int idLop) async {
    String url = getBaiktra + idLop.toString();
    String token = await Login.getToken();
    Map body;
    if (user.user!.idChucVu != 0) {
      body = {'trang_thai': '0'};
    } else {
      body = {'trang_thai': '1'};
    }
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

  static Future<BaiKtraSVModel?> Get_BKTraSV(int idLop) async {
    String url = urlgetBaiktraSV;
    String token = await Login.getToken();
    Map body = {
      "id_sinh_vien": user.user!.id.toString(),
      "id_lop_hoc_phan": idLop.toString(),
    };
    print(url);
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);
    print(response.body);
    if (response.statusCode == 200) {
      print('Status =200');
      final jsonResponse = BaiKtraSVModel.fromJson(json.decode(response.body));
      return jsonResponse;
    } else {
      print('status khác 200');
      return null;
    }
  }

  static Future<DanhSachLamKtraM?> Get_DSSVChualam(int idLop, int tt) async {
    String url;
    if (tt == 0) {
      url = urlgetSinhvienchualam;
    } else if (tt == 1) {
      url = urlgetSinhviendalam;
    } else {
      url = urlgetSinhvienall;
    }

    String token = await Login.getToken();
    Map body = {
      "id_bai_kiem_tra": idLop.toString(),
    };
    print(url);
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);
    print(response.body);
    if (response.statusCode == 200) {
      print('Status =200');
      final jsonResponse =
          DanhSachLamKtraM.fromJson(json.decode(response.body));
      return jsonResponse;
    } else {
      print('status khác 200');
      return null;
    }
  }

  static Future<CT_Bai_Ktra_model> Show_BKTra(int idBkta) async {
    String url = urlBaiktra + idBkta.toString();
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
      int idbkt,
      int idLop,
      int idGv,
      String noiDung,
      int tong,
      String batDau,
      String ketThuc,
      String trangthai) async {
    String url = urlBaiktra + idbkt.toString();
    String token = await Login.getToken();
    DateTime batDautime;
    DateTime ketThuctime;
    // print(idbkt);
    // print(id_lop);
    // print(id_gv);
    // print(noiDung);
    // print(tong);
    Map body = {
      "id_lop_hoc_phan": idLop.toString(),
      "id_giang_vien": idGv.toString(),
      "sl_cau_hoi": tong.toString(),
      "noi_dung": noiDung.toString(),
      "tg_bat_dau": batDau,
      "tg_ket_thuc": ketThuc,
      "trang_thai": trangthai
    };
    var response = await http.patch(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);
    print(response.body);
    Map<String, dynamic> map = json.decode(response.body);
    var posts = map["status"];
    print(posts);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> traLoiMotCau(
      String dapAn, int idCauHoi, int idBaiViet, int idCauTraLoi) async {
    String url = postTraLoi;
    String token = await Login.getToken();
    Map body = {
      "dap_an": dapAn.toString(),
      "id_cau_hoi": idCauHoi.toString(),
      "id_bai_kiem_tra": idBaiViet.toString(),
      "id_cau_tra_loi": idCauTraLoi.toString(),
    };
    print(user.user!.id!);
    print(
      "dap_an" + dapAn.toString(),
    );
    print(
      "id_cau_hoi" + idCauHoi.toString(),
    );
    print(
      "id_bai_kiem_tra" + idBaiViet.toString(),
    );
    print("cau tra3 loi27 " + idCauTraLoi.toString());
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);
    Map<String, dynamic> map = json.decode(response.body);
    var posts = map["message"];
    print(posts);
    if (response.statusCode == 200) {
      print('lưu');
      return true;
    }
    print('Không lưu 1');
    return false;
  }

  static Future<bool> BatdauKtra(int idktra, int idlophp) async {
    try {
      String url = postBatDktra;
      String token = await Login.getToken();
      Map body = {
        "id_bai_kiem_tra": idktra.toString(),
        "id_lop_hoc_phan": idlophp.toString(),
      };
      print("id bktra: " + idktra.toString());
      print("id_lop:" + idlophp.toString());
      var response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body);
      Map<String, dynamic> map = json.decode(response.body);
      var posts = map["message"];
      print(true);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<BaiDaLuuModel?> Getbaidaluu(int idbaiktra,int idSv) async {
    // try {
    String url = getBaiDaluu;
    String token = await Login.getToken();
    Map body = {
      "id_bai_ktra": idbaiktra.toString(),
      "id_sinh_vien": idSv.toString(),
    };
    print(idbaiktra);
    print(user.user!.id);
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);
    Map<String, dynamic> map = json.decode(response.body);
    var posts = map["message"];
    print(response.body);
    final jsonResponse =
        BaiDaLuuModel.fromJson(json.decode(response.body.toString()));
    return jsonResponse;
    // } catch (e) {
    //   return null;
    // }
  }

  static Future<bool> postNopBai(int idBaiKiemTra, int idSinhVien) async {
    try {
      String url = postNopbai;
      String token = await Login.getToken();
      Map body = {
        "id_bai_kiem_tra": idBaiKiemTra.toString(),
        "id_sinh_vien": idSinhVien.toString(),
      };
      var response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body);
      Map<String, dynamic> map = json.decode(response.body);
      var posts = map["message"];
      print(true);
      return true;
    } catch (e) {
      return false;
    }
  }
}
