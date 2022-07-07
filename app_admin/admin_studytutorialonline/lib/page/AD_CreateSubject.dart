import 'package:admin_studytutorialonline/widget/InputForm.dart';
import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';

class CreateSubject extends StatefulWidget {
  const CreateSubject({Key? key}) : super(key: key);

  @override
  State<CreateSubject> createState() => _CreateSubjectState();
}

class _CreateSubjectState extends State<CreateSubject> {
  final item = ['item 1', 'item 2', 'item 3', 'item 4'];
  final item2 = ['Lí Thuyết', 'Thực Hành', 'Module'];
  String? value;
  String? value2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.theme),
          backgroundColor: AppColor.white,
        ),
        body: SingleChildScrollView(
            child: Container(
                color: AppColor.white,
                width: getWidthSize(context),
                height: getHeightSize(context),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        getWidthSize(context) * 0.05, 20, 0, 0),
                    width: getWidthSize(context),
                    child: Text(
                      'Tạo Bộ Môn',
                      style: ggTextStyle(40, FontWeight.bold, AppColor.theme),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                        20, getWidthSize(context) * 0.05, 20),
                    height: 5,
                    width: getWidthSize(context),
                    color: AppColor.theme,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                        10, getWidthSize(context) * 0.05, 10),
                    width: getWidthSize(context),
                    child: Text(
                      'Tên Khoa',
                      style: ggTextStyle(13, FontWeight.bold, AppColor.black),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                          5, getWidthSize(context) * 0.05, 20),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: value,
                        items: item.map(buildItem).toList(),
                        onChanged: (value) =>
                            setState(() => this.value = value),
                      )),
                  FormInput(
                      title: 'Bộ môn',
                      hinttext: 'Nhập bộ môn...',
                      labeltext: 'Bộ môn',
                      preIcon: Icons.book),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                        10, getWidthSize(context) * 0.05, 10),
                    width: getWidthSize(context),
                    child: Text(
                      'Loại môn học',
                      style: ggTextStyle(13, FontWeight.bold, AppColor.black),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                          10, getWidthSize(context) * 0.05, 20),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: value2,
                        items: item2.map(buildItem2).toList(),
                        onChanged: (value2) =>
                            setState(() => this.value2 = value2),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.06,
                        10, getWidthSize(context) * 0.06, 10),
                    width: getWidthSize(context),
                    child: Row(
                      children: [
                        Container(
                            width: getWidthSize(context) * 0.4,
                            height: getHeightSize(context) * 0.06,
                            child: TextButton(
                              child: Text(
                                'Hủy',
                                style: ggTextStyle(
                                    20, FontWeight.bold, AppColor.black),
                              ),
                              onPressed: () {},
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                              color: AppColor.black,
                                              width: 1)))),
                            )),
                        Container(
                            margin: EdgeInsets.fromLTRB(
                                getWidthSize(context) * 0.08, 0, 0, 0),
                            width: getWidthSize(context) * 0.4,
                            height: getHeightSize(context) * 0.06,
                            child: ElevatedButton(
                              child: Text(
                                'Thêm',
                                style: ggTextStyle(
                                    20, FontWeight.bold, AppColor.white),
                              ),
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColor.theme),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ))),
                            ))
                      ],
                    ),
                  )
                ]))));
  }
}

DropdownMenuItem<String> buildItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: ggTextStyle(15, FontWeight.w600, AppColor.black),
    ));

DropdownMenuItem<String> buildItem2(String item2) => DropdownMenuItem(
    value: item2,
    child: Text(
      item2,
      style: ggTextStyle(15, FontWeight.w600, AppColor.black),
    ));
