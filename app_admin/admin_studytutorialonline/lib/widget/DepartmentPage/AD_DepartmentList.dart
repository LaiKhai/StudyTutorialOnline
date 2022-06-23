import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/dimen.dart';
import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:flutter/material.dart';

class DepartmentList extends StatefulWidget {
  const DepartmentList({Key? key}) : super(key: key);

  @override
  State<DepartmentList> createState() => _DepartmentListState();
}

class _DepartmentListState extends State<DepartmentList> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          height: getHeightSize(context) * 0.15,
          child: Card(
              semanticContainer: true,
              margin: EdgeInsets.all(6),
              child: ListTile(
                  title: Container(
                    margin: EdgeInsets.all(5),
                    child: Text('Công nghệ thông tin',
                        style:
                            ggTextStyle(20, FontWeight.bold, AppColor.theme)),
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.person,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Nguyễn Viết ZDung',
                            style: ggTextStyle(
                                12, FontWeight.bold, AppColor.black)),
                      ],
                    ),
                  ))))
    ]);
  }
}
