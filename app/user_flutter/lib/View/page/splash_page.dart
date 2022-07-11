import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_flutter/Model_View/login.dart';
import 'package:user_flutter/View/page/NaviGa.dart';
import 'package:user_flutter/View/page/us_login_screen.dart';

import '../common/constant/color.dart';

class US_Splash_Screen extends StatefulWidget {
  const US_Splash_Screen({Key? key}) : super(key: key);

  @override
  State<US_Splash_Screen> createState() => _US_Splash_ScreenState();
}

class _US_Splash_ScreenState extends State<US_Splash_Screen> {
  bool ktra = false;
  kiemtra() async {
    String token = await Login.getToken();
    Login.getUs();
    if (token != '') {
      setState(() {
        ktra = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    kiemtra();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          AnimatedSplashScreen(
            nextScreen: ktra ? Navigator_page() : const US_Login_Screen(),
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
