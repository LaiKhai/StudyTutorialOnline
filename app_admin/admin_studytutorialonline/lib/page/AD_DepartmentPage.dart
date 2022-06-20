import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:flutter/material.dart';

import '../widget/DepartmentPage/AD_DepartmentList.dart';

class KhoaPage extends StatefulWidget {
  const KhoaPage({Key? key}) : super(key: key);

  @override
  _KhoaPageState createState() => _KhoaPageState();
}

class _KhoaPageState extends State<KhoaPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: size.height / 4,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
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
                    color: AppColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            KhoaList(),
            const SizedBox(
              height: 10,
            ),
            KhoaList(),
            const SizedBox(
              height: 10,
            ),
            KhoaList(),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            child: new Icon(Icons.add),
            backgroundColor: new Color(0xFFE57373),
            onPressed: () {}));
  }
}
