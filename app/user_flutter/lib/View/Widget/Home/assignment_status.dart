import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Model/subject_assignment.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class AssignmentStatus extends StatelessWidget {
  final SubjectAssignmentType type;

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
          color: (type == SubjectAssignmentType.turnedIn
                  ? AppColor.green
                  : AppColor.red)
              .withOpacity(0.25)),
      child: Text(
        type == SubjectAssignmentType.turnedIn ? "Turned In" : "Missing",
        style: GoogleFonts.quicksand(
          color: type == SubjectAssignmentType.turnedIn
              ? AppColor.green
              : AppColor.red,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
