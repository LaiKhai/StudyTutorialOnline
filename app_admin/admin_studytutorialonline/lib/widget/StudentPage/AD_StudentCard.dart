import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';

class StudentCard extends StatefulWidget {
  StudentCard({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: getHeightSize(context) * 0.12,
          child: Card(
              semanticContainer: true,
              margin: EdgeInsets.all(6),
              child: ListTile(
                  leading: Container(
                      height: getHeightSize(context) * 0.2,
                      width: getWidthSize(context) * 0.2,
                      child: ClipRRect(
                          child: Image.asset(
                        'assets/images/no_image.png',
                        width: 300,
                        height: 300,
                      ))),
                  title: Container(
                    margin: EdgeInsets.all(5),
                    child: Text('Lai Hồng Khải',
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
