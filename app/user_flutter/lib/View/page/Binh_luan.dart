import 'package:flutter/material.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/dimen.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import 'package:user_flutter/View/common/navigator_index/index.dart';

class BinhLuan_Page extends StatefulWidget {
  const BinhLuan_Page({Key? key}) : super(key: key);

  @override
  State<BinhLuan_Page> createState() => _BinhLuan_PageState();
}

class _BinhLuan_PageState extends State<BinhLuan_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bình luận',
          style: ggTextStyle(25, FontWeight.bold, AppColor.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.theme,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.fromLTRB(5, 10, 10, 20),
                height: 110,
                child: ListTile(
                    leading: Container(
                        width: 40,
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset('assets/images/student_1.png'),
                        )),
                    title: Text(
                      'Sinh Viên A',
                      style: ggTextStyle(12, FontWeight.bold, AppColor.black),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            'Bình luận đây là bình luận',
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
                                '2022-07-16 10:22',
                                style: ggTextStyle(
                                    10, FontWeight.normal, AppColor.black),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              );
            }),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Nhập bình luận',
                  suffixIcon: Icon(
                    Icons.send_rounded,
                    color: AppColor.theme,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          )
        ],
      ),
    );
  }
}
