import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';

class SubjectCard extends StatefulWidget {
  final String subjectname;
  final String departmentName;
  final String credits;

  const SubjectCard(
      {Key? key,
      required this.subjectname,
      required this.departmentName,
      required this.credits})
      : super(key: key);

  @override
  State<SubjectCard> createState() => _SubjectCardState(
      subjectname: this.subjectname,
      departmentName: this.departmentName,
      credits: this.credits);
}

class _SubjectCardState extends State<SubjectCard> {
  String subjectName;
  String departmentName;
  int credits;
  _SubjectCardState({this.subjectName, this.departmentName, this.credits});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: getHeightSize(context) * 0.15,
          child: Card(
              semanticContainer: true,
              margin: EdgeInsets.all(6),
              child: ListTile(
                  title: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(subjectname.toString(),
                        style:
                            ggTextStyle(20, FontWeight.bold, AppColor.theme)),
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.person,
                            size: 15,
                          ),
                        ),
                        Container(
                          child: Text('Nguyễn Viết ZDung',
                              style: ggTextStyle(
                                  12, FontWeight.bold, AppColor.black)),
                        )
                      ],
                    ),
                  ))))
    ]);
  }
}
