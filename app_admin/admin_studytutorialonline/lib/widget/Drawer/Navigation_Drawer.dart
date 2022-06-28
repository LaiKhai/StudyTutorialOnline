import 'dart:ui';

import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:admin_studytutorialonline/page/AD_DepartmentPage.dart';
import 'package:admin_studytutorialonline/page/AD_HomePage.dart';
import 'package:admin_studytutorialonline/page/AD_SubjectPage.dart';
import 'package:admin_studytutorialonline/widget/DepartmentPage/AD_DepartmentList.dart';
import 'package:admin_studytutorialonline/widget/Subject/AD_SubjectCard.dart';
import 'package:flutter/material.dart';

import 'childwidget/Drawer_Button.dart';
import 'childwidget/Drawer_Form_Menu.dart';

class Navigationdrawerwidget extends StatefulWidget {
  Navigationdrawerwidget({Key? key}) : super(key: key);

  @override
  _NavigationdrawerwidgetState createState() => _NavigationdrawerwidgetState();
}

class _NavigationdrawerwidgetState extends State<Navigationdrawerwidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.theme,
      child: Column(
        children: [
          Stack(
            children: [
              Opacity(opacity: 0.5),
              Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/images/class_room.png'),
                        fit: BoxFit.cover)),
                alignment: Alignment.center,
                height: 300,
              ),
              // Container(
              //   child: Image.network(
              //     'https://noithatthanglong.vn/Content/Uploads/Articles/Van-phong-tong-giam-doc/Thiet-ke-van-phong-tong-giam-doc-dep-hien-dai-avata.jpg',
              //   ),
              // ),
              // BackdropFilter(
              //   filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 1),
              //   child: Container(
              //     color: Colors.black.withOpacity(0),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://kenh14cdn.com/2020/3/23/photo-1-15849581918401652775824.jpg'),
                      radius: 60,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Lai Khai',
                      style: ggTextStyle(20, FontWeight.bold, AppColor.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'lhkhai@caothang.edu.vn',
                      style: ggTextStyle(13, FontWeight.normal, AppColor.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Giảng viên',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Column(children: [
              ButtonWidget(
                  icon: Icons.home,
                  text: 'Trang chủ',
                  onClicked: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  top: 10,
                  left: 20,
                  bottom: 10,
                  right: 0),
              const Divider(
                  thickness: 1, indent: 20, endIndent: 20, color: Colors.white),
              ButtonWidget(
                  icon: Icons.cast_for_education_rounded,
                  text: 'Khoa',
                  onClicked: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => DepartmentPage())));
                  },
                  top: 10,
                  left: 20,
                  bottom: 5,
                  right: 0),
              ButtonWidget(
                  icon: Icons.class__rounded,
                  text: 'Bộ môn',
                  onClicked: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SubjectPage()));
                  },
                  top: 10,
                  left: 20,
                  bottom: 10,
                  right: 0),
              const Divider(
                  thickness: 1, indent: 20, endIndent: 20, color: Colors.white),
              ButtonWidget(
                  icon: Icons.co_present_rounded,
                  text: 'Lớp',
                  onClicked: () {},
                  top: 10,
                  left: 20,
                  bottom: 5,
                  right: 0),
              ButtonWidget(
                  icon: Icons.collections_bookmark_rounded,
                  text: 'Lớp học phần',
                  onClicked: () {},
                  top: 10,
                  left: 20,
                  bottom: 10,
                  right: 0),
              const Divider(
                  thickness: 1, indent: 20, endIndent: 20, color: Colors.white),
              ButtonWidget(
                  icon: Icons.face_sharp,
                  text: 'Sinh viên',
                  onClicked: () {},
                  top: 10,
                  left: 20,
                  bottom: 5,
                  right: 0),
              ButtonWidget(
                  icon: Icons.group,
                  text: 'Giảng viên',
                  onClicked: () {},
                  top: 10,
                  left: 20,
                  bottom: 10,
                  right: 0),
            ]),
          ),
          Button(),
        ],
      ),
    );
  }
}