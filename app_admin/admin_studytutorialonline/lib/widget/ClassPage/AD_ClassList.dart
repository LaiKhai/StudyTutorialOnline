import 'package:admin_studytutorialonline/data/ClassRoom.dart';
import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';

class ClassList extends StatelessWidget {
  final List<ClassRoom> lstClass;
  const ClassList({Key? key, required this.lstClass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          height: getHeightSize(context),
          child: ListView.builder(
              itemCount: lstClass.length,
              itemBuilder: (context, index) => Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  semanticContainer: true,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: ListTile(
                      title: Container(
                        margin: EdgeInsets.all(5),
                        child: Text(lstClass[index].tenlop,
                            style: ggTextStyle(
                                20, FontWeight.bold, AppColor.theme)),
                      ),
                      subtitle: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Row(children: [
                                Container(
                                  child: Icon(
                                    Icons.man_rounded,
                                    size: 15,
                                  ),
                                ),
                                Container(
                                  child: Text(lstClass[index].giangvien,
                                      style: ggTextStyle(
                                          12, FontWeight.bold, AppColor.black)),
                                )
                              ]),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                      child: Icon(
                                          Icons.domain_verification_outlined)),
                                  Container(
                                    child: Text(
                                      lstClass[index].nienkhoa,
                                      style: ggTextStyle(
                                          12, FontWeight.bold, AppColor.black),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )))))
    ]);
  }
}
