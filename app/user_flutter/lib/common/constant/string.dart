import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String font = '';
TextStyle ggTextStyle(double? size, FontWeight? fweight, Color? color) {
  return GoogleFonts.quicksand(
      fontSize: size, fontWeight: fweight, color: color);
}

const Key centerKey = ValueKey<String>('bottom-sliver-list');
const String urlLoginSinhVien = 'http://192.168.1.6:80/api/dnsv';
