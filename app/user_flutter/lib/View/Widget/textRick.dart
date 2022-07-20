import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class TextRick extends StatelessWidget {
  String td;
  String txt;
  TextRick({Key? key, required this.td, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: td,
        style: GoogleFonts.quicksand(
            fontSize: 16, fontWeight: FontWeight.w900, color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: txt,
            style: GoogleFonts.quicksand(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
