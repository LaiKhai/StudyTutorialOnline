import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';

class ClassList extends StatefulWidget {
  const ClassList({Key? key}) : super(key: key);

  @override
  State<ClassList> createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
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
                    child: Text('CĐ TH19PMA',
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
                                Icons.man_rounded,
                                size: 15,
                              ),
                            ),
                            Container(
                              child: Text('Tôn Long Phước',
                                  style: ggTextStyle(
                                      12, FontWeight.bold, AppColor.black)),
                            )
                          ]),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Icon(Icons.person),
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
