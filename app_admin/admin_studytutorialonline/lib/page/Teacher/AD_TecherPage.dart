import 'dart:convert';

import 'package:admin_studytutorialonline/data/Teachers.dart';
import 'package:admin_studytutorialonline/page/Teacher/AD_CreateTeacher.dart';
import 'package:admin_studytutorialonline/page/Teacher/AD_TeacherDetail.dart';
import 'package:admin_studytutorialonline/page/Teacher/AD_TeacherSetting.dart';
import 'package:admin_studytutorialonline/widget/TeacherPage/AD_TeacherCard.dart';
import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';
import '../../data/User.dart';
import '../../widget/Drawer/Navigation_Drawer.dart';
import '../../widget/StudentPage/AD_StudentCard.dart';
import 'package:http/http.dart' as http;

class TeacherPage extends StatefulWidget {
  final User us;
  const TeacherPage({Key? key, required this.us}) : super(key: key);

  @override
  State<TeacherPage> createState() => _TeacherPageState(us: us);
}

class _TeacherPageState extends State<TeacherPage> {
  String? selectedValue;
  List departmentItemList = [];
  Future getAllDepartment() async {
    var response = await http.get(Uri.parse(fetchDepartmentObject));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body)['khoa'];
      setState(() {
        departmentItemList = jsonData;
      });
    }
  }

  Future<Teachers> getAllTeacherwithDepartment() async {
    String? token = await getToken();
    var response = await http.post(Uri.parse(getTeacherwithDepartment),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: {
          'searchGV': selectedValue
        });
    if (response.statusCode == 200) {
      var teacherObject = Teachers.fromJson(json.decode(response.body));
      return teacherObject;
    } else {
      return new Teachers();
    }
  }

  final User us;
  _TeacherPageState({required this.us});

  @override
  void initState() {
    super.initState();
    getAllDepartment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navigationdrawerwidget(
          us: us,
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.theme,
          actions: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
                width: 45,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image.network(
                    baseUrl + us.avt,
                    fit: BoxFit.cover,
                  ),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: getHeightSize(context) * 0.2,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: AppColor.theme),
              child: Center(
                  child: Text(
                'Giảng Viên',
                style: ggTextStyle(30, FontWeight.bold, AppColor.white),
              )),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Giảng viên thuộc Khoa',
                style: ggTextStyle(13, FontWeight.bold, AppColor.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 15,
                  getWidthSize(context) * 0.05, 10),
              width: getWidthSize(context),
              height: getHeightSize(context) * 0.07,
              child: DropdownButton(
                value: selectedValue,
                isExpanded: true,
                hint: Text('Chọn Khoa...'),
                items: departmentItemList.map((department) {
                  return DropdownMenuItem(
                    value: department['ten_khoa'],
                    child: Text(department['ten_khoa']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String?;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Danh sách các thông báo',
                style: ggTextStyle(13, FontWeight.bold, AppColor.grey),
              ),
            ),
            selectedValue != null
                ? FutureBuilder<Teachers>(
                    future: getAllTeacherwithDepartment(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.lstgiangvien!.length == 0) {
                          return Center(
                            child: Text(
                              'Hiện tại chưa có giảng viên nào',
                              style: ggTextStyle(
                                  12, FontWeight.normal, AppColor.grey),
                            ),
                          );
                        }
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.lstgiangvien!.length,
                            itemBuilder: (context, index) {
                              var lstTeacher =
                                  snapshot.data!.lstgiangvien![index];
                              if (lstTeacher.trangThai != 0) {
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          height: getHeightSize(context) * 0.14,
                                          child: Card(
                                              semanticContainer: true,
                                              margin: EdgeInsets.all(6),
                                              child: ListTile(
                                                  trailing: Expanded(
                                                    flex: 1,
                                                    child: IconButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (ctx) =>
                                                                    TeacherSetting(
                                                                        teacherId:
                                                                            lstTeacher.id!,
                                                                        us: us)));
                                                      },
                                                      icon: Icon(
                                                        Icons.settings,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                TeacherDetail(
                                                                  teacherID:
                                                                      lstTeacher
                                                                          .id!,
                                                                  us: us,
                                                                )));
                                                  },
                                                  leading: Container(
                                                      height: getHeightSize(
                                                              context) *
                                                          0.3,
                                                      width: getWidthSize(
                                                              context) *
                                                          0.2,
                                                      child: ClipRRect(
                                                          child: Image.asset(
                                                        'assets/images/no_image.png',
                                                        width: 300,
                                                        height: 300,
                                                      ))),
                                                  title: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        5, 5, 5, 0),
                                                    child: Text(
                                                        lstTeacher.hoTen!,
                                                        style: ggTextStyle(
                                                            20,
                                                            FontWeight.bold,
                                                            AppColor.theme)),
                                                  ),
                                                  subtitle: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              5, 0, 5, 0),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    0, 0, 3, 8),
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          8,
                                                                          2,
                                                                          0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .person_pin_sharp,
                                                                    size: 15,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          8,
                                                                          2,
                                                                          0),
                                                                  child: Text(
                                                                    lstTeacher
                                                                        .maSo!,
                                                                    style: ggTextStyle(
                                                                        12,
                                                                        FontWeight
                                                                            .bold,
                                                                        AppColor
                                                                            .black),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    0, 4, 5, 0),
                                                            child: Row(
                                                              //mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              5),
                                                                  child: Icon(
                                                                    Icons
                                                                        .cast_for_education,
                                                                    size: 15,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                      lstTeacher
                                                                          .tenKhoa!,
                                                                      style: ggTextStyle(
                                                                          10,
                                                                          FontWeight
                                                                              .bold,
                                                                          AppColor
                                                                              .black)),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      )))))
                                    ]);
                              }
                              return Center(
                                child: Text(''),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Có lỗi xảy ra'),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    })
                : Center(
                    child: Text(
                      'Hãy chọn khoa mà bạn muốn xem...',
                      style: ggTextStyle(12, FontWeight.normal, AppColor.grey),
                    ),
                  ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            child: new Icon(Icons.add),
            backgroundColor: AppColor.theme,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CreateTeacher())));
            }));
  }
}
