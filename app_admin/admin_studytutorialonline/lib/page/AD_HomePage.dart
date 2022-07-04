import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/dimen.dart';
import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:admin_studytutorialonline/page/AD_Post.dart';
import 'package:admin_studytutorialonline/widget/Drawer/Navigation_Drawer.dart';
import 'package:flutter/material.dart';

import '../data/User.dart';
import '../widget/HomePage/AD_HomeList.dart';
import '../widget/HomePage/AD_HomeNotice.dart';

class HomePage extends StatefulWidget {
  final User us;
  const HomePage({Key? key, required this.us}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState(us: us);
  }
}

class _HomePageState extends State<HomePage> {
  final User us;
  _HomePageState({required this.us});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Navigationdrawerwidget(
        us: us,
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.theme,
        actions: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
              width: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.network(
                  baseUrl + us.avt,
                  fit: BoxFit.cover,
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: getHeightSize(context) * 0.2,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: AppColor.theme),
              child: Center(
                  child: Text(
                'Trang chủ',
                style: TextStyle(
                    color: AppColor.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600),
              )),
            ),
            Container(
              padding: EdgeInsets.only(top: getHeightSize(context) * 0.1),
              child: Column(
                children: [
                  Container(
                      padding:
                          EdgeInsets.only(left: getWidthSize(context) * 0.05),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Thông báo',
                          style:
                              ggTextStyle(13, FontWeight.bold, AppColor.grey),
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => PostPage()));
                        },
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                              height: 47,
                              width: 47,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(70),
                                child: Image.network(
                                  baseUrl + us.avt,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                'bạn muốn thông báo...',
                                style: ggTextStyle(
                                    12, FontWeight.normal, AppColor.grey),
                              ),
                            )
                          ],
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(
                          getWidthSize(context) * 0.05, 10, 10, 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Danh sách các thông báo',
                          style:
                              ggTextStyle(13, FontWeight.bold, AppColor.grey),
                        ),
                      )),
                  HomeList(),
                  HomeList(),
                ],
              ),
            )
          ]),
          Positioned(
            top: getHeightSize(context) * 0.15,
            left: getWidthSize(context) * 0.08,
            child: Container(
              height: 100,
              width: 100,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          '1k5',
                          style:
                              ggTextStyle(30, FontWeight.bold, AppColor.theme),
                        ),
                      ),
                      Container(
                        child: Text(
                          'sinh viên',
                          style:
                              ggTextStyle(13, FontWeight.w500, AppColor.theme),
                        ),
                      )
                    ],
                  )),
            ),
          ),
          Positioned(
            top: getHeightSize(context) * 0.15,
            left: getWidthSize(context) * 0.38,
            child: Container(
              height: 100,
              width: 100,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          '28',
                          style:
                              ggTextStyle(30, FontWeight.bold, AppColor.theme),
                        ),
                      ),
                      Container(
                        child: Text(
                          'giảng viên',
                          style:
                              ggTextStyle(13, FontWeight.w500, AppColor.theme),
                        ),
                      )
                    ],
                  )),
            ),
          ),
          Positioned(
            top: getHeightSize(context) * 0.15,
            left: getWidthSize(context) * 0.67,
            child: Container(
              height: 100,
              width: 100,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          '144',
                          style:
                              ggTextStyle(30, FontWeight.bold, AppColor.theme),
                        ),
                      ),
                      Container(
                        child: Text(
                          'lớp',
                          style:
                              ggTextStyle(13, FontWeight.w500, AppColor.theme),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ],
      )),
    );
  }
}
