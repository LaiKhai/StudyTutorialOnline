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

const String baseUrl = 'http://210.2.86.140';
const String loginUrl = baseUrl + '/api/admin';
const String fetchClassObject = baseUrl + '/api/lop';
const String fetchStatisticalObject = baseUrl + '/api/thongke';
