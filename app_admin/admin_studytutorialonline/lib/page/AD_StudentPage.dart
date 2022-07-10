import 'dart:convert';

import 'package:admin_studytutorialonline/page/AD_CreateStudent.dart';
import 'package:admin_studytutorialonline/widget/StudentPage/AD_StudentCard.dart';
import 'package:flutter/material.dart';

import '../common/contrains/color.dart';
import '../common/contrains/dimen.dart';
import '../common/contrains/string.dart';
import '../data/User.dart';
import '../widget/Drawer/Navigation_Drawer.dart';
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

  Future getAllStudentwithDepartment() async {
    String? token = await getToken();
    var response = await http.post(Uri.parse(getStudentwithDepartment),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: {
          'search': selectedValue
        });
    if (response.statusCode == 200) {
      var studentObject = json.decode(response.body)['data'];
      return studentObject;
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
                'Sinh Viên',
                style: ggTextStyle(30, FontWeight.bold, AppColor.white),
              )),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Sinh viên thuộc Khoa',
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
                ? FutureBuilder(
                    future: getAllStudentwithDepartment(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data?.length == 0) {
                          return Center(
                            child: Text(
                              'Hiện tại chưa có sinh viên nào',
                              style: ggTextStyle(
                                  12, FontWeight.normal, AppColor.grey),
                            ),
                          );
                        }
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              var lstStudent = snapshot.data[index];
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        height: getHeightSize(context) * 0.1,
                                        child: Card(
                                            semanticContainer: true,
                                            margin: EdgeInsets.all(6),
                                            child: ListTile(
                                                leading: Container(
                                                    height:
                                                        getHeightSize(context) *
                                                            0.2,
                                                    width:
                                                        getWidthSize(context) *
                                                            0.2,
                                                    child: ClipRRect(
                                                        child: Image.asset(
                                                      'assets/images/no_image.png',
                                                      width: 300,
                                                      height: 300,
                                                    ))),
                                                title: Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Text(
                                                      lstStudent['ho_ten'],
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
                                                                      right: 5),
                                                              child: Icon(
                                                                Icons
                                                                    .co_present_rounded,
                                                                size: 15,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                  lstStudent[
                                                                      'ten_lop'],
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
                                                                lstStudent[
                                                                    'nien_khoa'],
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
                  MaterialPageRoute(builder: (ctx) => CreateStudentPage()));
            }));
  }
}
