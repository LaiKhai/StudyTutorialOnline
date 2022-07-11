import 'package:admin_studytutorialonline/data/Subject.dart';
import 'package:admin_studytutorialonline/provider/Subject/SubjectProvider.dart';
import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';

class SubjectDetail extends StatefulWidget {
  final int subID;
  const SubjectDetail({Key? key, required this.subID}) : super(key: key);

  @override
  State<SubjectDetail> createState() => _SubjectDetailState(subID: subID);
}

class _SubjectDetailState extends State<SubjectDetail> {
  final int subID;
  _SubjectDetailState({required this.subID});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.theme),
          backgroundColor: AppColor.white,
        ),
        body: FutureBuilder<Subject?>(
          future: SubjectProvider.subjectDetail(context, subID),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'có lỗi xảy ra',
                  style: ggTextStyle(12, FontWeight.bold, AppColor.grey),
                ),
              );
            } else if (snapshot.hasData) {
              Subject subjectObject = snapshot.data!;
              return SingleChildScrollView(
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
                            subjectObject.ten_mon_hoc,
                            style: ggTextStyle(
                                40, FontWeight.bold, AppColor.theme),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              getWidthSize(context) * 0.05,
                              20,
                              getWidthSize(context) * 0.05,
                              20),
                          height: 5,
                          width: getWidthSize(context),
                          color: AppColor.theme,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              getWidthSize(context) * 0.05,
                              10,
                              getWidthSize(context) * 0.05,
                              10),
                          width: getWidthSize(context),
                          child: Text(
                            'Tên Khoa',
                            style: ggTextStyle(
                                13, FontWeight.bold, AppColor.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              getWidthSize(context) * 0.05,
                              5,
                              getWidthSize(context) * 0.05,
                              20),
                          child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.cast_for_education),
                                hintText: subjectObject.ten_khoa,
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: AppColor.theme)),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              getWidthSize(context) * 0.05,
                              10,
                              getWidthSize(context) * 0.05,
                              10),
                          width: getWidthSize(context),
                          child: Text(
                            'Tên môn học',
                            style: ggTextStyle(
                                13, FontWeight.bold, AppColor.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              getWidthSize(context) * 0.05,
                              5,
                              getWidthSize(context) * 0.05,
                              20),
                          child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.book),
                                hintText: subjectObject.loai_mon_hoc,
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: AppColor.theme)),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              getWidthSize(context) * 0.05,
                              10,
                              getWidthSize(context) * 0.05,
                              10),
                          width: getWidthSize(context),
                          child: Text(
                            'Loại môn học',
                            style: ggTextStyle(
                                13, FontWeight.bold, AppColor.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              getWidthSize(context) * 0.05,
                              5,
                              getWidthSize(context) * 0.05,
                              20),
                          child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.menu_book),
                                hintText: 'Loại Môn Học A',
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: AppColor.theme)),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              getWidthSize(context) * 0.06,
                              10,
                              getWidthSize(context) * 0.06,
                              10),
                          width: getWidthSize(context),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.fromLTRB(2, 10, 0, 0),
                                  width: getWidthSize(context) * 0.86,
                                  height: getHeightSize(context) * 0.06,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Xóa',
                                      style: ggTextStyle(
                                          20, FontWeight.bold, AppColor.white),
                                    ),
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColor.red),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ))),
                                  ))
                            ],
                          ),
                        )
                      ])));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
