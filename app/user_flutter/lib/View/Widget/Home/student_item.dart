import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Model/cTiet_LopHP.dart';
import 'package:user_flutter/Model/student.dart';
import 'package:user_flutter/View/Widget/Home/app_icon_buttton.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class StudentItem extends StatelessWidget {
  final Dssv student;

  const StudentItem({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(360),
            child: Image.network(
              'http://210.2.86.140/assets/images/no_image.png',
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.hoTen.toString(), //tên sinh viên
                  style: GoogleFonts.quicksand(
                    color: AppColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  student.email.toString(), //email sinh viên
                  style: GoogleFonts.quicksand(
                    color: AppColor.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          AppIconButton(
            icon:
                const Icon(Icons.chevron_right, size: 24, color: AppColor.grey),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
