import 'package:admin_studytutorialonline/data/ClassRoom.dart';
import 'package:admin_studytutorialonline/provider/ClassRoom/ClassRoomProvider.dart';
import 'package:admin_studytutorialonline/widget/ClassPage/AD_ClassList.dart';
import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';
import '../data/User.dart';
import '../widget/Drawer/Navigation_Drawer.dart';

class ClassPage extends StatefulWidget {
  final User us;
  const ClassPage({Key? key, required this.us}) : super(key: key);

  @override
  State<ClassPage> createState() => _ClassPageState(us: us);
}

class _ClassPageState extends State<ClassPage> {
  final User us;
  _ClassPageState({required this.us});
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
        body: FutureBuilder<List<ClassRoom>>(
          future: ClassRoomProvider.fetchObject(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Có lỗi xảy ra !');
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
                        child: Center(
                            child: Text(
                          'Lớp',
                          style:
                              ggTextStyle(30, FontWeight.bold, AppColor.white),
                        )),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Danh sách các thông báo',
                          style:
                              ggTextStyle(13, FontWeight.bold, AppColor.grey),
                        ),
                      ),
                      ClassList(lstClass: snapshot.data!),
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
