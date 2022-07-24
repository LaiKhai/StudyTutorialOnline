import 'package:flutter/material.dart';
import 'package:user_flutter/Model/Binhluan_model.dart';
import 'package:user_flutter/Model_View/BinhLuan_MV.dart';
import 'package:user_flutter/View/Widget/No_child.dart';
import 'package:user_flutter/View/Widget/widget_loadin.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/string.dart';

class LoadBinhLuan extends StatefulWidget {
  int ibBaiviet;
  LoadBinhLuan({Key? key, required this.ibBaiviet}) : super(key: key);

  @override
  State<LoadBinhLuan> createState() => _LoadBinhLuanState();
}

class _LoadBinhLuanState extends State<LoadBinhLuan> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BinhLuansM?>(
        future: BinhLuan_MV.getBinhLuan(widget.ibBaiviet.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.data!.length != 0) {
              return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    BinhLuanM dsBinhluan = snapshot.data!.data![index];
                    return Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 10, 20),
                      height: 110,
                      child: ListTile(
                          leading: Container(
                              width: 40,
                              height: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child:
                                    Image.asset('assets/images/student_1.png'),
                              )),
                          title: Text(
                            dsBinhluan.hoTen == null
                                ? 'Sinh Viên '
                                : dsBinhluan.hoTen!,
                            style: ggTextStyle(
                                12, FontWeight.bold, AppColor.black),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Text(
                                  dsBinhluan.noiDung == null
                                      ? 'Bình luận'
                                      : dsBinhluan.noiDung!,
                                  style: ggTextStyle(
                                      13, FontWeight.normal, AppColor.black),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Icon(
                                      Icons.av_timer_rounded,
                                      color: AppColor.grey,
                                      size: 15,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      dsBinhluan.createdAt == null
                                          ? '2022-07-16 10:22'
                                          : '${DateTime.parse(dsBinhluan.createdAt!).year}-${DateTime.parse(dsBinhluan.createdAt!).month}-${DateTime.parse(dsBinhluan.createdAt!).day} ${DateTime.parse(dsBinhluan.createdAt!).hour}:${DateTime.parse(dsBinhluan.createdAt!).minute}',
                                      style: ggTextStyle(10, FontWeight.normal,
                                          AppColor.black),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    );
                  });
            } else {
              print(snapshot.data!.data!.length.toString() + 'dsddsa');
              return NoChild(icon: 'comment.svg');
            }
          } else {
            return Loading();
          }
        });
  }
}
