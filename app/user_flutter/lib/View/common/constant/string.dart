import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String font = '';
TextStyle ggTextStyle(double? size, FontWeight? fweight, Color? color) {
  return GoogleFonts.quicksand(
      fontSize: size, fontWeight: fweight, color: color);
}

const String Link = 'http://192.168.1.3:8000';
const Key centerKey = ValueKey<String>('bottom-sliver-list');
const String urlLoginSinhVien = '$Link/api/dnsv';
const String urlLoginGiangVien = '$Link//api/dngv';
const String getClass = '$Link//api/lop';
