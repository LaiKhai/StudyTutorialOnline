import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String font = '';
TextStyle ggTextStyle(double? size, FontWeight? fweight, Color? color) {
  return GoogleFonts.quicksand(
      fontSize: size, fontWeight: fweight, color: color);
}

const String Link = 'http://210.2.86.140';
const Key centerKey = ValueKey<String>('bottom-sliver-list');
const String urlLogin = '$Link/api/login';
const String getAllClass = '$Link/api/lophocphan';
const String getClass = '$Link/api/lophocphanwithsinhvien/';
const String getClassGV = '$Link/api/lophocphanwithgiangvien/';
const String getOneClass = '$Link/api/lophocphan/';
const String postBaiviet = '$Link/api/baiviet';
const String getListwithclass = '$Link/api/listbaiviet/';
const String postBktra = '$Link/api/taobaiKT';
const String postCauHoi = '$Link/api/taoCauHoi';
const String urlBaiktra = '$Link/api/baikiemtra/';
const String getBaiktra = '$Link/api/listbaikiemtra/';
