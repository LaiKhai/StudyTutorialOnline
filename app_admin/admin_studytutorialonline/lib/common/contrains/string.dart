import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle ggTextStyle(double? size, FontWeight? fweight, Color? color) {
  return GoogleFonts.quicksand(
      fontSize: size, fontWeight: fweight, color: color);
}

const String baseUrl = 'http://210.2.86.140';
const String loginUrl = baseUrl + '/api/admin';
