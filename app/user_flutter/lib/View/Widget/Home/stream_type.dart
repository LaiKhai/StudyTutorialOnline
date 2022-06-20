import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Model/subject_stream.dart';

import '../../common/constant/color.dart';

class StreamType extends StatelessWidget {
  final SubjectStreamType type;

  const StreamType({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: (type == SubjectStreamType.material
                ? AppColor.material
                : AppColor.quiz)
            .withOpacity(0.15),
        borderRadius: BorderRadius.circular(360),
      ),
      child: Text(
        type == SubjectStreamType.material ? "Material" : "Quiz",
        style: GoogleFonts.quicksand(
          color: type == SubjectStreamType.material
              ? AppColor.material
              : AppColor.quiz,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
