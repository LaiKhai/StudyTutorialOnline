import 'dart:io';

import 'package:StudyTutorialOnlineAdmin/data/ClassRoom.dart';
import 'package:StudyTutorialOnlineAdmin/data/Teacher.dart';
import 'package:StudyTutorialOnlineAdmin/data/Teachers.dart';
import 'package:StudyTutorialOnlineAdmin/data/model_duy/Khoas_model.dart';
import 'package:StudyTutorialOnlineAdmin/data/model_duy/giangVien_model.dart';
import 'package:StudyTutorialOnlineAdmin/provider/ClassPart/ClassPartProvider.dart';
import 'package:StudyTutorialOnlineAdmin/provider/ClassRoom/ClassRoomProvider.dart';
import 'package:StudyTutorialOnlineAdmin/provider/Department/DepartmentProvider.dart';
import 'package:StudyTutorialOnlineAdmin/provider/Teacher/TeacherProvider.dart';
import 'package:StudyTutorialOnlineAdmin/widget/InputForm.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';
import '../../data/User.dart';
import '../../provider/Import_Export_file.dart';

class CreateClass extends StatefulWidget {
  final User us;
  const CreateClass({Key? key, required this.us}) : super(key: key);

  @override
  State<CreateClass> createState() => _CreateClassState(us: us);
}

class _CreateClassState extends State<CreateClass> {
  final User us;
  _CreateClassState({required this.us});
  TextEditingController _tenlopController = TextEditingController();
  TextEditingController _nienkhoaController =
      TextEditingController(text: DateTime.now().year.toString());
  List<Khoa> khoas = [];
  Khoa? value1;
  List<GiangVien_model> teachers = [];
  GiangVien_model? value2;
  getBanDau() async {
    Khoas lst = await DepartmentProvider.getAllKhoa();

    if (TeacherProvider.getAllGiangVien() != null) {
      final teachers_model = await TeacherProvider.getAllGiangVien();

      setState(() {
        teachers = teachers_model!.user!;
      });
    }

    setState(() {
      khoas = lst.khoa!;
    });
  }

  File? imgClassPart;
  chonAnh() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      imgClassPart = File(result.files.single.path!);
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBanDau();
  }

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
                      'T???o L???p',
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
                        20, getWidthSize(context) * 0.05, 10),
                    width: getWidthSize(context),
                    child: Text(
                      'Khoa',
                      style: ggTextStyle(13, FontWeight.bold, AppColor.black),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                          5, getWidthSize(context) * 0.05, 10),
                      child: DropdownButton<Khoa>(
                          isExpanded: true,
                          value: value1,
                          items: khoas.map(buildItem).toList(),
                          onChanged: (value) {
                            setState(() {
                              print(value!.id);
                              this.value1 = value;
                            });
                          })),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                        20, getWidthSize(context) * 0.05, 10),
                    width: getWidthSize(context),
                    child: Text(
                      'Gi???ng Vi??n Ch??? Nhi???m',
                      style: ggTextStyle(13, FontWeight.bold, AppColor.black),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05,
                          5, getWidthSize(context) * 0.05, 10),
                      child: DropdownButton<GiangVien_model>(
                          isExpanded: true,
                          value: value2,
                          items: teachers.map(buildItem2).toList(),
                          onChanged: (value) {
                            setState(() => this.value2 = value);
                          })),
                  FormInput(
                      isRead: false,
                      txtController: _tenlopController,
                      title: 'T??n L???p',
                      hinttext: 'Nh???p t??n l???p...',
                      labeltext: 'T??n l???p',
                      preIcon: Icons.home_repair_service_rounded),
                  FormInput(
                      isRead: false,
                      txtController: _nienkhoaController,
                      title: 'Ni??n kh??a',
                      hinttext: "2019...",
                      labeltext: 'Ni??n kh??a',
                      preIcon: Icons.date_range_rounded),
                  Container(
                    height: 50,
                    width: getWidthSize(context),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        height: 200,
                        width: getWidthSize(context),
                        child: Center(
                            child: Text(imgClassPart != null
                                ? imgClassPart.toString()
                                : 'hi???n t???i ch??a c?? file n??o')),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.06,
                        10, getWidthSize(context) * 0.06, 10),
                    width: getWidthSize(context),
                    child: Container(
                        margin: EdgeInsets.fromLTRB(2, 10, 0, 0),
                        width: getWidthSize(context) * 0.86,
                        height: getHeightSize(context) * 0.06,
                        child: ElevatedButton(
                          child: Text(
                            'Th??m file danh s??ch',
                            style: ggTextStyle(
                                20, FontWeight.bold, AppColor.white),
                          ),
                          onPressed: () {
                            imgClassPart = null;
                            chonAnh();
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColor.theme),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ))),
                        )),
                  ),
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
                                'H???y',
                                style: ggTextStyle(
                                    20, FontWeight.bold, AppColor.black),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
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
                                'Th??m',
                                style: ggTextStyle(
                                    20, FontWeight.bold, AppColor.white),
                              ),
                              onPressed: () {
                                if (value2 == null) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Text(
                                              'H??y ch???n gi???ng vi??n ch??? nhi???m tr?????c!',
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
                                              Text('Th??ng b??o',
                                                  style: ggTextStyle(
                                                      13,
                                                      FontWeight.bold,
                                                      AppColor.black))
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('OK',
                                                    style: ggTextStyle(
                                                        13,
                                                        FontWeight.bold,
                                                        AppColor.black)))
                                          ],
                                        );
                                      });
                                }
                                if (_tenlopController.text == '' ||
                                    _nienkhoaController.text == '' ||
                                    imgClassPart == null) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Text(
                                              'H??y ??i???n ?????y ????? th??ng tin!',
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
                                              Text('Th??ng b??o',
                                                  style: ggTextStyle(
                                                      13,
                                                      FontWeight.bold,
                                                      AppColor.black))
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('OK',
                                                    style: ggTextStyle(
                                                        13,
                                                        FontWeight.bold,
                                                        AppColor.black)))
                                          ],
                                        );
                                      });
                                }
                                if (value2 != null &&
                                    _tenlopController.text != '' &&
                                    _nienkhoaController.text != '' &&
                                    imgClassPart != null) {
                                  ClassRoomProvider.postClass(
                                      context,
                                      value1!.id.toString(),
                                      value2!.id.toString(),
                                      _tenlopController.text,
                                      _nienkhoaController.text,
                                      us);
                                  Import_Export.import(
                                      context, imgClassPart!, us);
                                }
                              },
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

DropdownMenuItem<Khoa> buildItem(Khoa item) => DropdownMenuItem(
    value: item,
    child: Text(
      item.tenKhoa!,
      style: ggTextStyle(15, FontWeight.w600, AppColor.black),
    ));
DropdownMenuItem<GiangVien_model> buildItem2(GiangVien_model item) =>
    DropdownMenuItem(
        value: item,
        child: Text(
          item.hoTen!,
          style: ggTextStyle(15, FontWeight.w600, AppColor.black),
        ));
