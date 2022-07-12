import 'package:admin_studytutorialonline/data/Teacher.dart';
import 'package:admin_studytutorialonline/data/Teachers.dart';
import 'package:admin_studytutorialonline/data/model_duy/Khoas_model.dart';
import 'package:admin_studytutorialonline/data/model_duy/giangVien_model.dart';
import 'package:admin_studytutorialonline/provider/ClassPart/ClassPartProvider.dart';
import 'package:admin_studytutorialonline/provider/Department/DepartmentProvider.dart';
import 'package:admin_studytutorialonline/provider/Teacher/TeacherProvider.dart';
import 'package:admin_studytutorialonline/widget/InputForm.dart';
import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';

class CreateClass extends StatefulWidget {
  const CreateClass({Key? key}) : super(key: key);

  @override
  State<CreateClass> createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
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
                      'Tạo Lớp',
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
                      'Giảng Viên Chủ Nhiệm',
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
                        onChanged: (value) =>
                            setState(() => this.value2 = value),
                      )),
                  FormInput(
                      isRead: false,
                      txtController: _tenlopController,
                      title: 'Tên Lớp',
                      hinttext: 'Nhập tên lớp...',
                      labeltext: 'Tên lớp',
                      preIcon: Icons.home_repair_service_rounded),
                  FormInput(
                      isRead: false,
                      txtController: _nienkhoaController,
                      title: 'Niên khóa',
                      hinttext: "2019...",
                      labeltext: 'Niên khóa',
                      preIcon: Icons.date_range_rounded),
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
                              onPressed: () {
                                if (value2 == null) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Text(
                                              'Hãy chọn giảng viên chủ nhiệm trước!',
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
                                    _nienkhoaController.text == '') {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Text(
                                              'Hãy điền đầy đủ thông tin!',
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
                                    _nienkhoaController.text != '') {
                                  ClassPartProvider.postClass(context,
                                      value2!.id.toString(),
                                      _tenlopController.text,
                                      _nienkhoaController.text);
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
