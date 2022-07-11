import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Model/bai_Viet.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/string.dart';

class ShowFile extends StatelessWidget {
  Files file;
  ShowFile({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (file.loaiFile!.toUpperCase() == 'PNG' ||
        file.loaiFile!.toUpperCase() == 'JPEG' ||
        file.loaiFile!.toUpperCase() == 'JPG ') {
      print('$Link/storage/${file.noiDung}');
      return Image.network('$Link/storage/${file.noiDung}');
    } else {
      return Text(
        '.' + file.loaiFile!,
        style: GoogleFonts.quicksand(
            color: AppColor.grey2, fontWeight: FontWeight.bold, fontSize: 25),
      );
    }
  }
}
