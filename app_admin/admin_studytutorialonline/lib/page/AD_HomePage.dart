import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/dimen.dart';
import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:admin_studytutorialonline/data/Statistical.dart';
import 'package:admin_studytutorialonline/page/AD_Post.dart';
import 'package:admin_studytutorialonline/page/AD_PostList.dart';
import 'package:admin_studytutorialonline/provider/Post/PostProvider.dart';
import 'package:admin_studytutorialonline/provider/Statistical/StatisticalProvider.dart';
import 'package:admin_studytutorialonline/widget/Drawer/Navigation_Drawer.dart';
import 'package:flutter/material.dart';

import '../data/Posts.dart';
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
  final ScrollController scrollController = new ScrollController();
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
        body: FutureBuilder<Statistical>(
          future: StatisticalProvider.fetchObject(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Xảy ra lỗi !');
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                  controller: scrollController,
                  child: Stack(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              padding: EdgeInsets.only(
                                  top: getHeightSize(context) * 0.1),
                              child: Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.fromLTRB(
                                          getWidthSize(context) * 0.05,
                                          0,
                                          10,
                                          10),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Danh sách các thông báo',
                                          style: ggTextStyle(13,
                                              FontWeight.bold, AppColor.grey),
                                        ),
                                      )),
                                  SizedBox(
                                    width: getWidthSize(context),
                                    height: getHeightSize(context),
                                    child: PostList(
                                      scrollController: scrollController,
                                    ),
                                  )
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
                                      snapshot.data!.sinhvien.toString(),
                                      style: ggTextStyle(
                                          30, FontWeight.bold, AppColor.theme),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'sinh viên',
                                      style: ggTextStyle(
                                          13, FontWeight.w500, AppColor.theme),
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
                                      snapshot.data!.giangvien.toString(),
                                      style: ggTextStyle(
                                          30, FontWeight.bold, AppColor.theme),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'giảng viên',
                                      style: ggTextStyle(
                                          13, FontWeight.w500, AppColor.theme),
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
                                      snapshot.data!.lop.toString(),
                                      style: ggTextStyle(
                                          30, FontWeight.bold, AppColor.theme),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'lớp',
                                      style: ggTextStyle(
                                          13, FontWeight.w500, AppColor.theme),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ],
                  ));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
