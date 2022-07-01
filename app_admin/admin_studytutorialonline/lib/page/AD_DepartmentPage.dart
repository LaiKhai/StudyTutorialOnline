import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/dimen.dart';
import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:flutter/material.dart';

import '../data/User.dart';
import '../widget/DepartmentPage/AD_DepartmentList.dart';
import '../widget/Drawer/Navigation_Drawer.dart';

class DepartmentPage extends StatefulWidget {
  final User us;
  const DepartmentPage({Key? key, required this.us}) : super(key: key);

  @override
  _DepartmentPageState createState() => _DepartmentPageState(us: us);
}

class _DepartmentPageState extends State<DepartmentPage> {
  final User us;
  _DepartmentPageState({required this.us});
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
              child: const Center(
                  child: Text(
                'Khoa',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600),
              )),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Danh sách các thông báo',
                style: TextStyle(
                    color: AppColor.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            DepartmentList(),
            const SizedBox(
              height: 10,
            ),
            DepartmentList(),
            const SizedBox(
              height: 10,
            ),
            DepartmentList(),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            child: new Icon(Icons.add),
            backgroundColor: new Color(0xFFE57373),
            onPressed: () {}));
  }
}
