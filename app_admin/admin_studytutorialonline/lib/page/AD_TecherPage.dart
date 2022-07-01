import 'package:admin_studytutorialonline/widget/TeacherPage/AD_TeacherCard.dart';
import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';
import '../data/User.dart';
import '../widget/Drawer/Navigation_Drawer.dart';
import '../widget/StudentPage/AD_StudentCard.dart';

class TeacherPage extends StatefulWidget {
  final User us;
  const TeacherPage({Key? key, required this.us}) : super(key: key);

  @override
  State<TeacherPage> createState() => _TeacherPageState(us: us);
}

class _TeacherPageState extends State<TeacherPage> {
  final User us;
  _TeacherPageState({required this.us});
  @override
  Widget build(BuildContext context) {
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
                width: 60,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ClipRRect(
                  child: Image.asset('assets/images/no_image.png'),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child:
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
                'Giảng Viên',
                style: ggTextStyle(30, FontWeight.bold, AppColor.white),
              )),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Danh sách các thông báo',
                style: ggTextStyle(13, FontWeight.bold, AppColor.grey),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TeacherCard(),
            const SizedBox(
              height: 10,
            ),
            TeacherCard(),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            child: new Icon(Icons.add),
            backgroundColor: new Color(0xFFE57373),
            onPressed: () {}));
  }
}
