// ignore_for_file: unnecessary_new, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:user_flutter/Model/bai_Viet.dart';
import 'package:user_flutter/Model/model_reing/model_bV.dart';
import 'package:user_flutter/Model/subject_stream.dart';
import 'package:user_flutter/View/Widget/Home/stream_type.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import 'package:user_flutter/View/page/Chi_tiet_bai_tap.dart';

class StreamItem extends StatelessWidget {
  final Baiviet bv;
  StreamItem({Key? key, required this.bv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bViet baiviet;
    if (bv.giangvien != null) {
      // ignore: unnecessary_new
      baiviet = new bViet(
          Ng_viet: bv.giangvien!.hoTen!,
          NoiDung: bv.noiDung!,
          avt: bv.giangvien!.avt!,
          time_viet: bv.createdAt!,
          Type: 1);
    } else {
      baiviet = new bViet(
          Ng_viet: bv.sinhvien!.hoTen!,
          NoiDung: bv.noiDung!,
          avt: bv.sinhvien!.avt!,
          time_viet: bv.createdAt!,
          Type: 1);
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x34090F13),
            offset: Offset(0, 2),
          )
        ],
        color: Colors.white,
        border: Border.all(color: const Color(0xFFdcdcdc), width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (baiviet.Type == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Chi_tiet_Page()),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   stream.type == SubjectStreamType.material
                  //       ? "assets/icons/material.svg"
                  //       : "assets/icons/quiz.svg",
                  //   color: AppColor.white,
                  //   width: 24,
                  //   height: 24,
                  // ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(Link + baiviet.avt),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          baiviet.Ng_viet,
                          style: GoogleFonts.quicksand(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          DateFormat("MMM dd").format(baiviet.time_viet),
                          style: GoogleFonts.quicksand(
                            color: AppColor.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Type
                  StreamType(type: baiviet.Type),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(baiviet.NoiDung),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: const Color(0xFFdcdcdc),
          ),
          InkWell(
            splashColor: AppColor.white.withOpacity(0.05),
            highlightColor: AppColor.white.withOpacity(0.15),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/comment.svg",
                    color: AppColor.grey,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "Add class's comment",
                    style: GoogleFonts.quicksand(
                      color: AppColor.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
