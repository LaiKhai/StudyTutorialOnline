import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Model/subject_assignment.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class AssignmentStatus extends StatelessWidget {
  final int type;

  const AssignmentStatus({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(360),
          color: (type == 3
                  ? AppColor.green
                  : type == 2
                      ? AppColor.red
                      : AppColor.grey2)
              .withOpacity(0.25)),
      child: Text(
        type == 3
            ? "Hoàn thành"
            : type == 2
                ? "Chưa hoàn thành"
                : "Có vấn đề xảy ra",
        style: GoogleFonts.quicksand(
          color: type == 3
              ? AppColor.green
              : type == 2
                  ? AppColor.red
                  : AppColor.grey2,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
