import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextStyle ggTextStyle(double? size, FontWeight? fweight, Color? color) {
  return GoogleFonts.quicksand(
      fontSize: size, fontWeight: fweight, color: color);
}

Future<String?> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString("token");
}

Key centerKey = const ValueKey<String>('bottom-sliver-list');
const String baseUrl = 'http://210.2.86.140';
const String loginUrl = baseUrl + '/api/admin';
const String fetchClassObject = baseUrl + '/api/lop';
const String fetchDepartmentObject = baseUrl + '/api/khoa';
const String fetchStatisticalObject = baseUrl + '/api/thongke';
const String createDepartmentUrl = baseUrl + '/api/khoa';

//Lay lop, lophocphan, bomon, sinhvien, giangvien theo khoa
const String getSubjectwithDepartment = baseUrl + '/api/searchBoMon';
const String getClasswithDepartment = baseUrl + '/api/searchLopwithKhoa';
const String getClassPartwithDepartment = baseUrl + '/api/lophocphanwithkhoa';
const String getTeacherwithDepartment =
    baseUrl + '/api/searchGiangVienwithKhoa';
const String getStudentwithDepartment = baseUrl + '/api/searchSinhVienwithKhoa';

const String updateclasses = baseUrl + '/api/lop/';

//Tao bomon
const String createSubjectObject = baseUrl + '/api/bomon';
const String detailSubjectObject = baseUrl + '/api/bomon/';

// sinh vien
const String detailStudentObject = baseUrl + '/api/sinhvien/';
const String deleteStudentObject = baseUrl + '/api/sinhvien/';
const String createStudentObject = baseUrl + '/api/sinhvien';

//giang vien
const String detailTeacherObject = baseUrl + '/api/giangvien/';
const String updateTeacherObject = baseUrl + '/api/giangvien/';
const String deleteTeacherObject = baseUrl + '/api/giangvien/';

//khoa
const String deleteDepartment = baseUrl + '/api/khoa/';
const String detailDepartment = baseUrl + '/api/khoa/';

//baiviet
const String getAllposts = baseUrl + '/api/baiviet';

//lop hoc phan
const String createClassPartObject = baseUrl + '/api/lophocphan';
const String classPartDetail = baseUrl + '/api/lophocphan/';
const String updateClassPartObject = baseUrl + '/api/lophocphan/';
const String getallGiangVien = baseUrl + '/api/giangvien';
