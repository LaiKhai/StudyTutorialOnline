import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Model/User_login.dart';
import 'package:user_flutter/Model/subject_assignment.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class AssignmentStatus extends StatelessWidget {
  final int type;

  const AssignmentStatus({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (user.user!.idChucVu != 0) {
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
                        : type == 3
                            ? Colors.deepPurple
                            : type == 4
                                ? Colors.blueAccent
                                : AppColor.grey2)
                .withOpacity(0.25)),
        child: Text(
          type == 1
              ? "Đã kết thúc bài kiểm tra"
              : type == 2
                  ? "Chưa bắt đầu kiểm tra"
                  : type == 3
                      ? "Chưa xác định"
                      : type == 4
                          ? "Đã bắt đầu"
                          : "Có vấn đề xảy ra",
          style: GoogleFonts.quicksand(
              color: type == 1
                  ? AppColor.green
                  : type == 2
                      ? AppColor.red
                      : type == 3
                          ? Colors.deepPurple
                          : type == 4
                              ? Colors.blueAccent
                              : AppColor.grey2),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360),
            color: (type == 1
                    ? AppColor.green
                    : type == 2
                        ? AppColor.red
                        : type == 3
                            ? Colors.deepPurple
                            : type == 4
                                ? Colors.blueAccent
                                : AppColor.grey2)
                .withOpacity(0.25)),
        child: Text(
          type == 1
              ? "Đã hoàn thành bài"
              : type == 2
                  ? "Đã hoàn thành trễ"
                  : type == 3
                      ? "Chưa nộp bài"
                      : type == 4
                          ? "Đã bắt đầu"
                          : "Có vấn đề xảy ra",
          style: GoogleFonts.quicksand(
              color: type == 1
                  ? AppColor.green
                  : type == 2
                      ? AppColor.red
                      : type == 3
                          ? Colors.deepPurple
                          : type == 4
                              ? Colors.blueAccent
                              : AppColor.grey2),
        ),
      );
    }
  }
}
