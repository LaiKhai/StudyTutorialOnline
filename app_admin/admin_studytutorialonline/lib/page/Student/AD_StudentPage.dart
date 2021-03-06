import 'dart:convert';

import 'package:StudyTutorialOnlineAdmin/data/Student.dart';
import 'package:StudyTutorialOnlineAdmin/data/Students.dart';
import 'package:StudyTutorialOnlineAdmin/page/Student/AD_CreateStudent.dart';
import 'package:StudyTutorialOnlineAdmin/page/Student/AD_StudentDetail.dart';
import 'package:StudyTutorialOnlineAdmin/page/Student/AD_StudentSetting.dart';
import 'package:StudyTutorialOnlineAdmin/widget/StudentPage/AD_StudentCard.dart';
import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';
import '../../data/User.dart';
import '../../widget/Drawer/Navigation_Drawer.dart';
import 'package:http/http.dart' as http;

class StudentPage extends StatefulWidget {
  final User us;
  const StudentPage({Key? key, required this.us}) : super(key: key);

  @override
  State<StudentPage> createState() => _StudentPageState(us: us);
}

class _StudentPageState extends State<StudentPage> {
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

  Future<Students> getAllStudentwithDepartment() async {
    String? token = await getToken();
    var response = await http.post(Uri.parse(getStudentwithDepartment),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: {
          'searchSV': selectedValue
        });
    print(response.body);
    if (response.statusCode == 200) {
      var studentObject = Students.fromJson(json.decode(response.body));
      return studentObject;
    } else {
      return new Students();
    }
  }

  final User us;
  _StudentPageState({required this.us});

  @override
  void initState() {
    super.initState();
    getAllDepartment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navigationdrawerwidget(us: us),
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
                'Sinh Vi??n',
                style: ggTextStyle(30, FontWeight.bold, AppColor.white),
              )),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Sinh vi??n thu???c Khoa',
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
                'Danh s??ch c??c sinh vi??n',
                style: ggTextStyle(13, FontWeight.bold, AppColor.grey),
              ),
            ),
            selectedValue != null
                ? FutureBuilder<Students>(
                    future: getAllStudentwithDepartment(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.only_student!.length == 0) {
                          return Center(
                            child: Text(
                              'Hi???n t???i ch??a c?? sinh vi??n n??o',
                              style: ggTextStyle(
                                  12, FontWeight.normal, AppColor.grey),
                            ),
                          );
                        }
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.only_student!.length,
                            itemBuilder: (context, index) {
                              Only_Student student =
                                  snapshot.data!.only_student![index];
                              if (student.trangThai != 0) {
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          height: getHeightSize(context) * 0.1,
                                          child: Card(
                                              semanticContainer: true,
                                              margin: EdgeInsets.all(6),
                                              child: ListTile(
                                                  trailing: IconButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  StudentSetting(
                                                                    studentId:
                                                                        student
                                                                            .id!,
                                                                    us: us,
                                                                  )));
                                                    },
                                                    icon: Icon(
                                                      Icons.settings,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                StudentDetail(
                                                                  studentId:
                                                                      student
                                                                          .id!,
                                                                  us: us,
                                                                )));
                                                  },
                                                  leading: Container(
                                                      height: getHeightSize(
                                                              context) *
                                                          0.2,
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
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(student.hoTen!,
                                                        style: ggTextStyle(
                                                            20,
                                                            FontWeight.bold,
                                                            AppColor.theme)),
                                                  ),
                                                  subtitle: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            //mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            5),
                                                                child: Icon(
                                                                  Icons
                                                                      .co_present_rounded,
                                                                  size: 15,
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Text(
                                                                    student
                                                                        .tenLop!,
                                                                    style: ggTextStyle(
                                                                        12,
                                                                        FontWeight
                                                                            .bold,
                                                                        AppColor
                                                                            .black)),
                                                              ),
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            10,
                                                                            0,
                                                                            2,
                                                                            0),
                                                                child: Icon(
                                                                  Icons
                                                                      .date_range,
                                                                  size: 15,
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Text(
                                                                  student
                                                                      .nienKhoa!,
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
                          child: Text('C?? l???i x???y ra'),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => CreateStudentPage(
                            us: us,
                          )));
            }));
  }
}
