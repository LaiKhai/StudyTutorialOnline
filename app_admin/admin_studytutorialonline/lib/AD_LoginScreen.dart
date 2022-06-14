import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class AD_LoginScreen extends StatefulWidget {
  const AD_LoginScreen({Key? key}) : super(key: key);

  @override
  State<AD_LoginScreen> createState() => _AD_LoginScreenState();
}

class _AD_LoginScreenState extends State<AD_LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 261.0, start: -93.0),
            Pin(size: 261.0, start: -103.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff5846b),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 13,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 223.0, end: -112.0),
            Pin(size: 223.0, end: -145.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff5846b),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(-4, 2),
                    blurRadius: 13,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 76.0, end: -24.0),
            Pin(size: 76.0, start: 100.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff5846b),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 13,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 43.0, end: 43.0),
            Pin(size: 320.0, start: 82.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/ad_img_login.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
