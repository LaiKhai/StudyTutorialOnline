import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Model/subject.dart';
import '../../common/constant/color.dart';

class SubjectItem extends StatelessWidget {
  final Subject subject;

  const SubjectItem({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFEEEEEE),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Color.fromARGB(255, 113, 112, 112),
                offset: Offset(4, 3),
                spreadRadius: 1,
              )
            ],
            gradient: LinearGradient(
              colors: subject.gradient,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject.name,
                    style: GoogleFonts.quicksand(
                      color: AppColor.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subject.lecturer,
                    style: GoogleFonts.quicksand(
                      color: AppColor.white.withOpacity(0.75),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Image.asset(
                subject.image,
                width: 72,
                height: 72,
              ),
            ],
          ),
        ),
        const Positioned(
          right: 8,
          top: 8,
          child: Icon(Icons.more_vert, color: AppColor.white),
        ),
      ],
    );
  }
}
