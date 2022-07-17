import 'dart:ui';

import 'package:StudyTutorialOnlineAdmin/common/contrains/color.dart';
import 'package:StudyTutorialOnlineAdmin/common/contrains/string.dart';
import 'package:StudyTutorialOnlineAdmin/page/AD_ImportExportDSSV.dart';
import 'package:StudyTutorialOnlineAdmin/page/ClassRoom/AD_Class.dart';
import 'package:StudyTutorialOnlineAdmin/page/ClassPart/AD_ClassPart.dart';
import 'package:StudyTutorialOnlineAdmin/page/Department/AD_DepartmentPage.dart';
import 'package:StudyTutorialOnlineAdmin/page/AD_HomePage.dart';
import 'package:StudyTutorialOnlineAdmin/page/Student/AD_StudentPage.dart';
import 'package:StudyTutorialOnlineAdmin/page/Subject/AD_SubjectPage.dart';
import 'package:StudyTutorialOnlineAdmin/page/Teacher/AD_TecherPage.dart';
import 'package:StudyTutorialOnlineAdmin/widget/ClassPart/AD_ClassPartList.dart';
import 'package:StudyTutorialOnlineAdmin/widget/DepartmentPage/AD_DepartmentList.dart';
import 'package:StudyTutorialOnlineAdmin/widget/Subject/AD_SubjectCard.dart';
import 'package:flutter/material.dart';

import '../../data/User.dart';
import 'childwidget/Drawer_Button.dart';
import 'childwidget/Drawer_Form_Menu.dart';

class Navigationdrawerwidget extends StatefulWidget {
  final User us;
  Navigationdrawerwidget({Key? key, required this.us}) : super(key: key);

  @override
  _NavigationdrawerwidgetState createState() =>
      _NavigationdrawerwidgetState(us: us);
}

class _NavigationdrawerwidgetState extends State<Navigationdrawerwidget> {
  final User us;
  _NavigationdrawerwidgetState({required this.us});
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
                        baseUrl + us.avt,
                      ),
                      radius: 60,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      us.ho_ten,
                      style: ggTextStyle(20, FontWeight.bold, AppColor.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      us.email,
                      style: ggTextStyle(13, FontWeight.normal, AppColor.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      us.chuc_vu,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                  us: us,
                                )));
                  },
                  top: 10,
                  left: 20,
                  bottom: 10,
                  right: 0),
              Divider(
                  thickness: 1, indent: 20, endIndent: 20, color: Colors.white),
              ButtonWidget(
                  icon: Icons.cast_for_education_rounded,
                  text: 'Khoa',
                  onClicked: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => DepartmentPage(us: us))));
                  },
                  top: 10,
                  left: 20,
                  bottom: 5,
                  right: 0),
              ButtonWidget(
                  icon: Icons.class_rounded,
                  text: 'Bộ môn',
                  onClicked: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubjectPage(
                                  us: us,
                                )));
                  },
                  top: 10,
                  left: 20,
                  bottom: 10,
                  right: 0),
              Divider(
                  thickness: 1, indent: 20, endIndent: 20, color: Colors.white),
              ButtonWidget(
                  icon: Icons.co_present_rounded,
                  text: 'Lớp',
                  onClicked: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClassPage(us: us)));
                  },
                  top: 10,
                  left: 20,
                  bottom: 5,
                  right: 0),
              ButtonWidget(
                  icon: Icons.collections_bookmark_rounded,
                  text: 'Lớp học phần',
                  onClicked: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClassPartPage(us: us)));
                  },
                  top: 10,
                  left: 20,
                  bottom: 10,
                  right: 0),
              Divider(
                  thickness: 1, indent: 20, endIndent: 20, color: Colors.white),
              ButtonWidget(
                  icon: Icons.face_sharp,
                  text: 'Sinh viên',
                  onClicked: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentPage(us: us)));
                  },
                  top: 10,
                  left: 20,
                  bottom: 5,
                  right: 0),
              ButtonWidget(
                  icon: Icons.group,
                  text: 'Giảng viên',
                  onClicked: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeacherPage(us: us)));
                  },
                  top: 10,
                  left: 20,
                  bottom: 10,
                  right: 0),
              ButtonWidget(
                  icon: Icons.import_contacts_rounded,
                  text: 'Import/Export DSSV',
                  onClicked: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Import_Export_DSSV(
                                  us: us,
                                )));
                  },
                  top: 10,
                  left: 20,
                  bottom: 0,
                  right: 0),
            ]),
          ),
          Button(),
        ],
      ),
    );
  }
}
