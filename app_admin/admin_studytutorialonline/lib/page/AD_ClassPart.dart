import 'package:admin_studytutorialonline/widget/ClassPart/AD_ClassPartList.dart';
import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';
import '../data/User.dart';
import '../widget/Drawer/Navigation_Drawer.dart';

class ClassPartPage extends StatefulWidget {
  final User us;
  const ClassPartPage({Key? key, required this.us}) : super(key: key);

  @override
  State<ClassPartPage> createState() => _ClassPartPageState(us: us);
}

class _ClassPartPageState extends State<ClassPartPage> {
  final User us;
  _ClassPartPageState({required this.us});
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
                'Lớp Học Phần',
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
            ClassPartList(),
            SizedBox(
              height: 10,
            ),
            ClassPartList(),
            const SizedBox(
              height: 10,
            ),
            ClassPartList(),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            child: new Icon(Icons.add),
            backgroundColor: new Color(0xFFE57373),
            onPressed: () {}));
  }
}
