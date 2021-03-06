import 'dart:convert';

import 'package:StudyTutorialOnlineAdmin/common/contrains/string.dart';
import 'package:StudyTutorialOnlineAdmin/data/Department.dart';
import 'package:StudyTutorialOnlineAdmin/page/Subject/AD_CreateSubject.dart';
import 'package:StudyTutorialOnlineAdmin/page/Subject/AD_CreateSubject.dart';
import 'package:StudyTutorialOnlineAdmin/page/Subject/AD_SubjectDetail.dart';
import 'package:StudyTutorialOnlineAdmin/page/Subject/AD_SubjectSetting.dart';
import 'package:StudyTutorialOnlineAdmin/widget/Subject/AD_SubjectCard.dart';
import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../data/Subject.dart';
import '../../data/Subjects.dart';
import '../../data/User.dart';
import '../../widget/Drawer/Navigation_Drawer.dart';
import 'package:http/http.dart' as http;

class SubjectPage extends StatefulWidget {
  final User us;
  SubjectPage({Key? key, required this.us}) : super(key: key);

  @override
  State<SubjectPage> createState() => _SubjectPageState(us: us);
}

class _SubjectPageState extends State<SubjectPage> {
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

  Future<Subjects?> getAllubjectwithDepartment() async {
    String? token = await getToken();
    var response = await http.post(Uri.parse(getSubjectwithDepartment),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: {
          'search': selectedValue
        });
    if (response.statusCode == 200) {
      var subjectObject = Subjects.fromJson(json.decode(response.body));
      return subjectObject;
    }
    return new Subjects();
  }

  final User us;
  _SubjectPageState({required this.us});

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
                'B??? M??n',
                style: ggTextStyle(30, FontWeight.bold, AppColor.white),
              )),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'B??? m??n thu???c Khoa',
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
                'Danh s??ch c??c b??? m??n',
                style: ggTextStyle(13, FontWeight.bold, AppColor.grey),
              ),
            ),
            selectedValue != null
                ? FutureBuilder<Subjects?>(
                    future: getAllubjectwithDepartment(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.bomon!.length == 0) {
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
                            itemCount: snapshot.data!.bomon!.length,
                            itemBuilder: (context, index) {
                              BoMon lstsubject = snapshot.data!.bomon![index];
                              if (lstsubject.trangThai != 0) {
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
                                                  trailing: Container(
                                                    width: 30,
                                                    height: 30,
                                                    child: IconButton(
                                                      icon: Icon(
                                                        Icons.settings,
                                                        size: 20,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        SubjectSetting(
                                                                          subjectId:
                                                                              lstsubject.id!,
                                                                          us: us,
                                                                        )));
                                                      },
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: ((context) =>
                                                                SubjectDetail(
                                                                  subID:
                                                                      lstsubject
                                                                          .id!,
                                                                  us: us,
                                                                ))));
                                                  },
                                                  title: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                        lstsubject.tenMonHoc!,
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
                                                                      .cast_for_education,
                                                                  size: 15,
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Text(
                                                                    lstsubject
                                                                        .tenKhoa!,
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
                                                                      .book_outlined,
                                                                  size: 15,
                                                                ),
                                                              ),
                                                              if (lstsubject
                                                                      .loaiMonHoc! ==
                                                                  1)
                                                                Container(
                                                                  child: Text(
                                                                    'L?? Thuy???t',
                                                                    style: ggTextStyle(
                                                                        12,
                                                                        FontWeight
                                                                            .bold,
                                                                        AppColor
                                                                            .black),
                                                                  ),
                                                                )
                                                              else if (lstsubject
                                                                      .loaiMonHoc! ==
                                                                  2)
                                                                Container(
                                                                  child: Text(
                                                                    'Th???c H??nh',
                                                                    style: ggTextStyle(
                                                                        12,
                                                                        FontWeight
                                                                            .bold,
                                                                        AppColor
                                                                            .black),
                                                                  ),
                                                                )
                                                              else if (lstsubject
                                                                      .loaiMonHoc! ==
                                                                  3)
                                                                Container(
                                                                  child: Text(
                                                                    'Th???c H??nh',
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
                      builder: (context) => CreateSubject(us: us)));
            }));
  }
}
