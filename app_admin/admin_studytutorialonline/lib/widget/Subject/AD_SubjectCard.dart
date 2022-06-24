import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';

class SubjectCard extends StatefulWidget {
  SubjectCard({
    Key? key,
  }) : super(key: key);

  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
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
                    child: Text('Mạng Máy Tính',
                        style:
                            ggTextStyle(20, FontWeight.bold, AppColor.theme)),
                  ),
                  subtitle: Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.cast_for_education,
                                  size: 15,
                                ),
                              ),
                              Container(
                                child: Text('Công Nghệ Thông Tin',
                                    style: ggTextStyle(
                                        12, FontWeight.bold, AppColor.black)),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 2, 0),
                                child: Icon(
                                  Icons.book_outlined,
                                  size: 15,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "12",
                                  style: ggTextStyle(
                                      12, FontWeight.bold, AppColor.black),
                                ),
                              )
                            ],
                          ),
                        ],
                      )))))
    ]);
  }
}
