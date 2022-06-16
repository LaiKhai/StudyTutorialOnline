import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/View/page/dang_Thong_bao.dart';

import '../../common/constant/color.dart';

class SubjectPost extends StatelessWidget {
  const SubjectPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x34090F13),
            offset: Offset(0, 2),
          )
        ],
        border: Border.all(color: Color(0xFFdcdcdc), width: 1.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Dang_thong_bao()),
          );
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child: Image.asset(
                "assets/images/user.png",
                width: 36,
                height: 36,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                "Thông báo nội dùng nào đó cho lớp học của bạn",
                style: GoogleFonts.quicksand(
                  color: AppColor.grey.withOpacity(0.5),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
