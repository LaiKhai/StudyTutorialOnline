import 'package:StudyTutorialOnlineAdmin/data/Subject.dart';
import 'package:StudyTutorialOnlineAdmin/provider/Subject/SubjectProvider.dart';
import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';
import '../../data/User.dart';

class SubjectDetail extends StatefulWidget {
  final int subID;
  final User us;
  const SubjectDetail({Key? key, required this.subID, required this.us})
      : super(key: key);

  @override
  State<SubjectDetail> createState() =>
      _SubjectDetailState(subID: subID, us: us);
}

class _SubjectDetailState extends State<SubjectDetail> {
  final int subID;
  final User us;
  _SubjectDetailState({required this.subID, required this.us});

  loaimonhoc(String idloai) {
    if (idloai == "1") {
      return 'Lý Thuyết';
    } else if (idloai == "2") {
      return 'Thực Hành';
    } else if (idloai == "3") {
      return 'Module';
    }
  }

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
              OnlySubject subjectObject = snapshot.data!.only_subject!;
              if (subjectObject.trangThai != "0") {
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
                              subjectObject.tenMonHoc!,
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
                                  hintText: subjectObject.tenKhoa!,
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: AppColor.theme)),
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
                                  hintText: subjectObject.tenMonHoc.toString(),
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: AppColor.theme)),
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
                                  hintText: loaimonhoc(
                                      subjectObject.loaiMonHoc.toString()),
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: AppColor.theme)),
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
                                        style: ggTextStyle(20, FontWeight.bold,
                                            AppColor.white),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: Text(
                                                    'Bạn có chắc muốn xóa bộ môn ${subjectObject.tenMonHoc!}',
                                                    style: ggTextStyle(
                                                        13,
                                                        FontWeight.bold,
                                                        AppColor.black)),
                                                title: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.warning_rounded,
                                                      color: AppColor.theme,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('Thông báo',
                                                        style: ggTextStyle(
                                                            13,
                                                            FontWeight.bold,
                                                            AppColor.black))
                                                  ],
                                                ),
                                                actions: [
                                                  Container(
                                                    child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text('Không',
                                                            style: ggTextStyle(
                                                                13,
                                                                FontWeight.bold,
                                                                AppColor
                                                                    .black))),
                                                  ),
                                                  Container(
                                                    child: TextButton(
                                                        onPressed: () {
                                                          SubjectProvider
                                                              .deleteSubject(
                                                                  context,
                                                                  subjectObject
                                                                      .idKhoa
                                                                      .toString(),
                                                                  subjectObject
                                                                      .tenMonHoc
                                                                      .toString(),
                                                                  subjectObject
                                                                      .loaiMonHoc
                                                                      .toString(),
                                                                  us,
                                                                  subjectObject
                                                                      .id!);
                                                        },
                                                        child: Text('Có',
                                                            style: ggTextStyle(
                                                                13,
                                                                FontWeight.bold,
                                                                AppColor
                                                                    .black))),
                                                  )
                                                ],
                                              );
                                            });
                                      },
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
              } else {
                return Center(
                  child: Text('Không có dữ liệu...'),
                );
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
