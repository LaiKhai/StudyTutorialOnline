import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/View/common/constant/color.dart';

void showCustomDialog(BuildContext context, String text, bool yes) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    pageBuilder: (context, __, ___) {
      return Center(
        child: Container(
          height: 250,
          width: 250,
          child: SizedBox.expand(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              yes
                  ? SvgPicture.asset(
                      'assets/images/svg/tich.svg',
                      color: Colors.white,
                      height: 50,
                      width: 50,
                    )
                  : SvgPicture.asset(
                      'assets/images/svg/not_tich.svg',
                      color: Colors.white,
                      height: 50,
                      width: 50,
                    ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  text,
                  style: GoogleFonts.quicksand(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          )),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: US_APP_COLOR, borderRadius: BorderRadius.circular(50)),
        ),
      );
    },
    transitionBuilder: (context, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
