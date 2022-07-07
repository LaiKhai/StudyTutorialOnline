import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/dimen.dart';
import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:admin_studytutorialonline/data/Department.dart';
import 'package:admin_studytutorialonline/provider/Department/DepartmentProvider.dart';
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
        body: FutureBuilder<List<Department>>(
          future: DepartmentProvider.fetchObject(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('có lỗi xảy ra !'),
              );
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      DepartmentList(
                        lstDepartment: snapshot.data!,
                      ),
                    ]),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: new Icon(Icons.add),
            backgroundColor: new Color(0xFFE57373),
            onPressed: () {}));
  }
}
