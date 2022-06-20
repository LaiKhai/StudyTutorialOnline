import 'dart:ui';

import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:flutter/material.dart';

import 'childwidget/Drawer_Button.dart';
import 'childwidget/Drawer_Form_Menu.dart';
import 'package:google_fonts/google_fonts.dart';

class Navigationdrawerwidget extends StatefulWidget {
  const Navigationdrawerwidget({Key? key}) : super(key: key);

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
                height: 240,
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
                  children: const [
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
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'lhkhai@caothang.edu.vn',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: AppColor.white),
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
                  onClicked: () {},
                  top: 10,
                  left: 20,
                  bottom: 10,
                  right: 0),
              const Divider(
                  thickness: 1, indent: 20, endIndent: 20, color: Colors.white),
              ButtonWidget(
                  icon: Icons.home,
                  text: 'Khoa',
                  onClicked: () {},
                  top: 10,
                  left: 20,
                  bottom: 0,
                  right: 0),
              ButtonWidget(
                  icon: Icons.home,
                  text: 'Bộ môn',
                  onClicked: () {},
                  top: 10,
                  left: 20,
                  bottom: 10,
                  right: 0),
              const Divider(
                  thickness: 1, indent: 20, endIndent: 20, color: Colors.white),
              ButtonWidget(
                  icon: Icons.home,
                  text: 'Lớp',
                  onClicked: () {},
                  top: 10,
                  left: 20,
                  bottom: 0,
                  right: 0),
              ButtonWidget(
                  icon: Icons.home,
                  text: 'Lớp học phần',
                  onClicked: () {},
                  top: 10,
                  left: 20,
                  bottom: 10,
                  right: 0),
              const Divider(
                  thickness: 1, indent: 20, endIndent: 20, color: Colors.white),
              ButtonWidget(
                  icon: Icons.home,
                  text: 'Sinh viên',
                  onClicked: () {},
                  top: 10,
                  left: 20,
                  bottom: 0,
                  right: 0),
              ButtonWidget(
                  icon: Icons.home,
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
