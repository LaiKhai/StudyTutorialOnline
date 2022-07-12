import 'package:admin_studytutorialonline/data/ClassPart.dart';
import 'package:admin_studytutorialonline/provider/ClassPart/ClassPartProvider.dart';
import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';
import '../data/User.dart';
import '../widget/InputForm.dart';

class ClassPartDetail extends StatefulWidget {
  final User us;
  final int classpartID;
  const ClassPartDetail({Key? key, required this.us, required this.classpartID})
      : super(key: key);

  @override
  State<ClassPartDetail> createState() =>
      _ClassPartDetailState(us: us, classpartID: classpartID);
}

class _ClassPartDetailState extends State<ClassPartDetail> {
  TextEditingController _classpartController = TextEditingController();
  final User us;
  final int classpartID;
  _ClassPartDetailState({required this.us, required this.classpartID});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.theme),
          backgroundColor: AppColor.white,
        ),
        body: FutureBuilder<ClassPart?>(
            future: ClassPartProvider.classpartDetail(context, classpartID),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Có lỗi xảy ra !'),
                );
              } else if (snapshot.hasData) {
                Lophocphan classPart = snapshot.data!.lophocphan!;
                if (classPart.trangThai != "0") {
                  return SingleChildScrollView(
                    child: Container(
                        color: AppColor.white,
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                getWidthSize(context) * 0.05, 20, 0, 0),
                            width: getWidthSize(context),
                            child: Text(
                              classPart.bomon!.tenMonHoc.toString(),
                              style: ggTextStyle(
                                  30, FontWeight.bold, AppColor.theme),
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
                          FormInput(
                              isRead: true,
                              txtController: _classpartController,
                              title: 'Tên lớp',
                              hinttext: classPart.lop!.tenLop!,
                              labeltext: classPart.lop!.tenLop!,
                              preIcon: Icons.email),
                          Container(
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                              width: getWidthSize(context),
                              height: getHeightSize(context) * 0.3,
                              child: Image.network(
                                baseUrl + classPart.avt.toString(),
                                fit: BoxFit.cover,
                              )),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                getWidthSize(context) * 0.06,
                                10,
                                getWidthSize(context) * 0.06,
                                10),
                            width: getWidthSize(context),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(2, 10, 0, 0),
                                    width: getWidthSize(context) * 0.86,
                                    height: getHeightSize(context) * 0.06,
                                    child: ElevatedButton(
                                      child: Text(
                                        'Thêm Danh Sách Sinh Viên',
                                        style: ggTextStyle(20, FontWeight.bold,
                                            AppColor.white),
                                      ),
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  AppColor.theme),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ))),
                                    )),
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
                                                    'Bạn có chắc muốn xóa ${classPart.lop!.tenLop!}',
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
                                                          ClassPartProvider
                                                              .deleteClassPart(
                                                                  context,
                                                                  classPart.avt
                                                                      .toString(),
                                                                  classPart
                                                                      .idBoMon
                                                                      .toString(),
                                                                  classPart
                                                                      .idLop
                                                                      .toString(),
                                                                  us,
                                                                  classpartID);
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
                        ])),
                  );
                }
                return Center(
                  child: Text(''),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
