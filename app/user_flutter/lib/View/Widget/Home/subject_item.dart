import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Model/color_Subject.dart';
import 'package:user_flutter/Model/lop_HP.dart';
import 'package:user_flutter/Model/subject.dart';
import 'package:user_flutter/View/common/constant/dimen.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import '../../common/constant/color.dart';

class SubjectItem extends StatelessWidget {
  final Lophocphan subject;

  const SubjectItem({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    int randomNumber = random.nextInt(4);
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
              colors: gradient[randomNumber],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: getWidthSize(context) * 1 / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject.tenMonHoc!,
                      style: GoogleFonts.quicksand(
                        color: AppColor.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(subject.tenLop!,
                        style: GoogleFonts.quicksand(
                          color: AppColor.white.withOpacity(0.75),
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.clip),
                  ],
                ),
              ),
              CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    subject.avt == null
                        ? 'https://i.pinimg.com/originals/71/4e/c4/714ec474db7fe0a3b55d34aa6ec247e8.jpg'
                        : subject.avt == ""
                            ? 'https://i.pinimg.com/originals/71/4e/c4/714ec474db7fe0a3b55d34aa6ec247e8.jpg'
                            : Link + '/storage/' + subject.avt!.toString(),
                  )),
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
