import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:admin_studytutorialonline/widget/Subject/AD_SubjectCard.dart';
import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../data/User.dart';
import '../widget/Drawer/Navigation_Drawer.dart';

class SubjectPage extends StatefulWidget {
  final User us;
  SubjectPage({Key? key, required this.us}) : super(key: key);

  @override
  State<SubjectPage> createState() => _SubjectPageState(us: us);
}

class _SubjectPageState extends State<SubjectPage> {
  final User us;
  _SubjectPageState({required this.us});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navigationdrawerwidget(us: us),
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
                'Bộ Môn',
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
            SubjectCard(),
            const SizedBox(
              height: 10,
            ),
            SubjectCard(),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            child: new Icon(Icons.add),
            backgroundColor: new Color(0xFFE57373),
            onPressed: () {}));
  }
}
