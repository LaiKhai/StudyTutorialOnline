import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:user_flutter/Model/subject_stream.dart';
import 'package:user_flutter/View/Widget/Home/stream_type.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/page/Chi_tiet_bai_tap.dart';

class StreamItem extends StatelessWidget {
  final SubjectStream stream;
  const StreamItem({Key? key, required this.stream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        boxShadow: [
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
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Chi_tiet_Page()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    stream.type == SubjectStreamType.material
                        ? "assets/icons/material.svg"
                        : "assets/icons/quiz.svg",
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
                          stream.title,
                          style: GoogleFonts.quicksand(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          DateFormat("MMM dd").format(stream.postedAt),
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
                  StreamType(type: stream.type),
                ],
              ),
            ),
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
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
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
