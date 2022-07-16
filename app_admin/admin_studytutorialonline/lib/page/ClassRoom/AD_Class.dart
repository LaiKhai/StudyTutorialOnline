import 'dart:convert';
import 'package:StudyTutorialOnlineAdmin/page/ClassRoom/AD_CreateClass.dart';
import 'package:StudyTutorialOnlineAdmin/page/ClassRoom/Class_detail.dart';
import 'package:StudyTutorialOnlineAdmin/provider/ClassRoom/ClassRoomProvider.dart';
import 'package:flutter/material.dart';

import '../../common/contrains/color.dart';
import '../../common/contrains/dimen.dart';
import '../../common/contrains/string.dart';
import '../../data/User.dart';
import '../../widget/Drawer/Navigation_Drawer.dart';
import 'package:http/http.dart' as http;

class ClassPage extends StatefulWidget {
  final User us;
  const ClassPage({Key? key, required this.us}) : super(key: key);

  @override
  State<ClassPage> createState() => _ClassPageState(us: us);
}

class _ClassPageState extends State<ClassPage> {
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
    print(departmentItemList);
  }

  Future getAllClasswithDepartment() async {
    String? token = await getToken();
    var response = await http.post(Uri.parse(getClasswithDepartment),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: {
          'khoa': selectedValue
        });
    if (response.statusCode == 200) {
      var classObject = json.decode(response.body)['lop'];
      return classObject;
    }
  }

  final User us;
  _ClassPageState({required this.us});

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
                'Lớp',
                style: ggTextStyle(30, FontWeight.bold, AppColor.white),
              )),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Lớp thuộc Khoa',
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
                'Danh sách lớp',
                style: ggTextStyle(13, FontWeight.bold, AppColor.grey),
              ),
            ),
            selectedValue != null
                ? FutureBuilder(
                    future: getAllClasswithDepartment(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data?.length == 0) {
                          return Center(
                            child: Text(
                              'Hiện tại chưa có bộ môn nào',
                              style: ggTextStyle(
                                  12, FontWeight.normal, AppColor.grey),
                            ),
                          );
                        }
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              var lstClass = snapshot.data[index];
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ClassDetail(
                                                    id: lstClass['id'],
                                                    us: us,
                                                  )),
                                        );
                                      },
                                      onLongPress: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: Text(
                                                    'Bạn muốn xoá lớp này?',
                                                    style: ggTextStyle(
                                                        13,
                                                        FontWeight.bold,
                                                        AppColor.black)),
                                                title: Row(
                                                  children: [
                                                    const Icon(
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
                                                        ClassRoomProvider.updateClass(
                                                            context,
                                                            lstClass['id_khoa']
                                                                .toString(),
                                                            lstClass['id']
                                                                .toString(),
                                                            lstClass[
                                                                    'id_giangvien']
                                                                .toString(),
                                                            lstClass['ten_lop'],
                                                            lstClass[
                                                                'nien_khoa'],
                                                            0.toString(),
                                                            us);
                                                      },
                                                      child: Text('Có',
                                                          style: ggTextStyle(
                                                              13,
                                                              FontWeight.bold,
                                                              AppColor.black))),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Không',
                                                          style: ggTextStyle(
                                                              13,
                                                              FontWeight.bold,
                                                              AppColor.black)))
                                                ],
                                              );
                                            });
                                      },
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          semanticContainer: true,
                                          margin: EdgeInsets.fromLTRB(
                                              20, 0, 20, 20),
                                          child: ListTile(
                                              title: Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(lstClass['ten_lop'],
                                                    style: ggTextStyle(
                                                        20,
                                                        FontWeight.bold,
                                                        AppColor.theme)),
                                              ),
                                              subtitle: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 8),
                                                child: Row(
                                                  //mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      child: Row(children: [
                                                        Container(
                                                          child: Icon(
                                                            Icons.man_rounded,
                                                            size: 15,
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Text(
                                                              lstClass[
                                                                  'ho_ten'],
                                                              style: ggTextStyle(
                                                                  12,
                                                                  FontWeight
                                                                      .bold,
                                                                  AppColor
                                                                      .black)),
                                                        )
                                                      ]),
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                              child: Icon(Icons
                                                                  .domain_verification_outlined)),
                                                          Container(
                                                            child: Text(
                                                              lstClass[
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
                                                    )
                                                  ],
                                                ),
                                              ))),
                                    )
                                  ]);
                            });
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Có lỗi xảy ra'),
                        );
                      }
                      return CircularProgressIndicator();
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => CreateClass(
                            us: us,
                          ))));
            }));
  }
}
