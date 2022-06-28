import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';

class ClassPartList extends StatefulWidget {
  const ClassPartList({Key? key}) : super(key: key);

  @override
  State<ClassPartList> createState() => _ClassPartListState();
}

class _ClassPartListState extends State<ClassPartList> {
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
                    child: Text('Mạng Máy Tính',
                        style:
                            ggTextStyle(20, FontWeight.bold, AppColor.theme)),
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(children: [
                            Container(
                              child: Icon(
                                Icons.book_sharp,
                                size: 15,
                              ),
                            ),
                            Container(
                              child: Text('CĐ TH 19PMA',
                                  style: ggTextStyle(
                                      12, FontWeight.bold, AppColor.black)),
                            )
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.person,
                                  size: 20,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "65",
                                  style: ggTextStyle(
                                      12, FontWeight.bold, AppColor.black),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))))
    ]);
  }
}
