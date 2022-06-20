import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:user_flutter/Model/subject_assignment.dart';
import 'package:user_flutter/View/Widget/Home/assignment_status.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class AssignmentItem extends StatelessWidget {
  final SubjectAssignment assignment;

  const AssignmentItem({Key? key, required this.assignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
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
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/assignment.svg",
                      color: AppColor.white,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            assignment.title,
                            style: GoogleFonts.quicksand(
                              color: AppColor.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Due at " +
                                DateFormat("MMM dd").format(assignment.dueAt),
                            style: GoogleFonts.quicksand(
                              color: AppColor.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    AssignmentStatus(type: assignment.type),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    assignment.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.quicksand(
                      color: AppColor.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
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
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Color(0xFFdcdcdc),
                  ),
                ),
              ),
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
