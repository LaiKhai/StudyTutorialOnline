import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/common/constant/color.dart';

enum AssignmentType { assigned, missed }

class AssignmentWeek extends StatelessWidget {
  final int count;
  final List<String> subjects;
  final AssignmentType type;

  const AssignmentWeek(
      {Key? key,
      required this.count,
      required this.subjects,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: AppColor.white.withOpacity(0.05),
      highlightColor: AppColor.white.withOpacity(0.15),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color:
              type == AssignmentType.assigned ? AppColor.theme : AppColor.red,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              color: Color.fromARGB(255, 170, 162, 162),
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  count.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  type == AssignmentType.assigned
                      ? "Đã hoàn thành"
                      : "Đã hết hạn",
                  style: GoogleFonts.quicksand(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              subjects.join(","),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color.fromARGB(255, 249, 238, 238),
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
