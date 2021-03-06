import 'dart:convert';

import 'package:StudyTutorialOnlineAdmin/data/ClassParts.dart';
import 'package:StudyTutorialOnlineAdmin/data/Department.dart';
import 'package:StudyTutorialOnlineAdmin/page/ClassPart/AD_CLassPartSetting.dart';
import 'package:StudyTutorialOnlineAdmin/page/ClassPart/AD_ClassPartDetail.dart';
import 'package:StudyTutorialOnlineAdmin/page/ClassPart/AD_CreateClassPart.dart';
import 'package:StudyTutorialOnlineAdmin/provider/ClassPart/ClassPartProvider.dart';
import 'package:StudyTutorialOnlineAdmin/widget/ClassPart/AD_ClassPartList.dart';
import 'package:StudyTutorialOnlineAdmin/widget/DepartmentPage/AD_DepartmentList.dart';
import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';
import '../../data/User.dart';
import '../../widget/Drawer/Navigation_Drawer.dart';

import 'package:http/http.dart' as http;

class ClassPartPage extends StatefulWidget {
  final User us;
  const ClassPartPage({Key? key, required this.us}) : super(key: key);

  @override
  State<ClassPartPage> createState() => _ClassPartPageState(us: us);
}

class _ClassPartPageState extends State<ClassPartPage> {
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

  Future<ClassParts> getAllClassPartwithDepartment() async {
    String? token = await getToken();
    var response = await http.post(Uri.parse(getClassPartwithDepartment),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: {
          'khoa': selectedValue
        });
    if (response.statusCode == 200) {
      var teacherObject = ClassParts.fromJson(json.decode(response.body));
      return teacherObject;
    } else {
      return new ClassParts();
    }
  }

  final User us;
  _ClassPartPageState({required this.us});

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
                'L???p H???c Ph???n',
                style: ggTextStyle(30, FontWeight.bold, AppColor.white),
              )),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 40,
                  getWidthSize(context) * 0.05, 5),
              child: Text(
                'L???p h???c ph???n thu???c Khoa',
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
                hint: Text('Ch???n Khoa...'),
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
                'Danh s??ch c??c l???p h???c ph???n',
                style: ggTextStyle(13, FontWeight.bold, AppColor.grey),
              ),
            ),
            selectedValue != null
                ? FutureBuilder<ClassParts>(
                    future: getAllClassPartwithDepartment(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.lophocphan!.length == 0) {
                          return Center(
                            child: Text(
                              'Hi???n t???i ch??a c?? b??? m??n n??o',
                              style: ggTextStyle(
                                  12, FontWeight.normal, AppColor.grey),
                            ),
                          );
                        }
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.lophocphan!.length,
                            itemBuilder: (context, index) {
                              var lstClassPart =
                                  snapshot.data!.lophocphan![index];
                              if (lstClassPart.trangThai != 0) {
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          height: getHeightSize(context) * 0.15,
                                          child: Card(
                                              semanticContainer: true,
                                              margin: EdgeInsets.all(6),
                                              child: ListTile(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ClassPartDetail(
                                                                    us: us,
                                                                    classpartID:
                                                                        lstClassPart
                                                                            .id!)));
                                                  },
                                                  trailing: IconButton(
                                                    icon: Icon(Icons.settings),
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (ctx) =>
                                                                  ClassPartSetting(
                                                                    us: us,
                                                                    classpartID:
                                                                        lstClassPart
                                                                            .id!,
                                                                  )));
                                                    },
                                                  ),
                                                  title: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                        lstClassPart.tenMonHoc
                                                            .toString(),
                                                        style: ggTextStyle(
                                                            20,
                                                            FontWeight.bold,
                                                            AppColor.theme)),
                                                  ),
                                                  subtitle: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Column(
                                                      //mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 2, 5, 5),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                child: Icon(
                                                                  Icons
                                                                      .cast_for_education,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            5),
                                                                child: Text(
                                                                  selectedValue
                                                                      .toString(),
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
                                                          child: Row(children: [
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          2,
                                                                          5,
                                                                          5),
                                                              child: Icon(
                                                                Icons
                                                                    .book_sharp,
                                                                size: 20,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                  lstClassPart
                                                                      .tenLop
                                                                      .toString(),
                                                                  style: ggTextStyle(
                                                                      12,
                                                                      FontWeight
                                                                          .bold,
                                                                      AppColor
                                                                          .black)),
                                                            )
                                                          ]),
                                                        ),
                                                      ],
                                                    ),
                                                  ))))
                                    ]);
                              }
                              return Center(
                                child: Text(''),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('C?? l???i x???y ra'),
                        );
                      }
                      return CircularProgressIndicator();
                    })
                : Center(
                    child: Text(
                      'H??y ch???n khoa m?? b???n mu???n xem...',
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
                  MaterialPageRoute(builder: (ctx) => CreateClassPart(us: us)));
            }));
  }
}
