import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/dimen.dart';
import 'package:admin_studytutorialonline/widget/Drawer/Navigation_Drawer.dart';
import 'package:flutter/material.dart';

import '../widget/HomePage/AD_HomeList.dart';
import '../widget/HomePage/AD_HomeNotice.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Navigationdrawerwidget(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.theme,
        actions: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
              width: 60,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: ClipRRect(
                child: Image.asset('assets/images/no_image.png'),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: getHeightSize(context) * 0.2,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: AppColor.theme),
            child: const Center(
                child: Text(
              'Trang chủ',
              style: TextStyle(
                  color: AppColor.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          const HomeNoti(),
          const SizedBox(
            height: 10,
          ),
          const HomeList(),
          const SizedBox(
            height: 10,
          ),
          const HomeList(),
        ]),
      ),
    );
  }
}
