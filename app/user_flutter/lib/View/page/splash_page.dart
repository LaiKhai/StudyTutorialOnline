import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_flutter/View/page/us_login_screen.dart';

import '../common/constant/color.dart';

class US_Splash_Screen extends StatelessWidget {
  const US_Splash_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          AnimatedSplashScreen(
            nextScreen: const US_Login_Screen(),
            backgroundColor: US_APP_COLOR,
            splash: SvgPicture.asset('assets/images/svg/logo_app.svg'),
            duration: 2000,
            splashTransition: SplashTransition.fadeTransition,
          ),
        ],
      )),
    );
  }
}
