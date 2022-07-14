import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:user_flutter/Model/subject_assignment.dart';
import 'package:user_flutter/View/Widget/Home/assignment_status.dart';

import '../../common/constant/color.dart';

class AssignmentHighlight extends StatelessWidget {
  final SubjectAssignment assignment;
  final ValueChanged<SubjectAssignment> onTap;

  const AssignmentHighlight(
      {Key? key, required this.assignment, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        splashColor: AppColor.white.withOpacity(0.05),
        highlightColor: AppColor.white.withOpacity(0.15),
        onTap: () {
          onTap(assignment);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: US_APP_LINE,
              width: 1.3,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                assignment.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.quicksand(
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Due ${DateFormat('MMM dd, HH:mm').format(assignment.dueAt)}",
                style: GoogleFonts.quicksand(
                  color: AppColor.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/assignment.svg",
                    width: 24,
                    height: 24,
                    color: AppColor.white,
                  ),
                  const SizedBox(width: 8),
                  // Assignment status
                  // AssignmentStatus(type: assignment.type),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
