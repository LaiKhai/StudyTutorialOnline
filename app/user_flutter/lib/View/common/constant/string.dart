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
const String getClass = '$Link//api/lop';
