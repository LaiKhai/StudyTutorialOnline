import 'package:flutter/material.dart';
import 'package:user_flutter/Model/User_login.dart';
import 'package:user_flutter/Model_View/BinhLuan_MV.dart';
import 'package:user_flutter/View/Widget/Binhluan/NaviBl.dart';
import 'package:user_flutter/View/Widget/Binhluan/loadBinhLuanView.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/string.dart';

class BinhLuan_Page extends StatefulWidget {
  int id_baiviet;
  int id_lophp;
  BinhLuan_Page({Key? key, required this.id_baiviet, required this.id_lophp})
      : super(key: key);

  @override
  State<BinhLuan_Page> createState() => _BinhLuan_PageState();
}

class _BinhLuan_PageState extends State<BinhLuan_Page> {
  TextEditingController textcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomWillPopBL(
      child: Scaffold(
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
                child: LoadBinhLuan(
              ibBaiviet: widget.id_baiviet,
            )),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextField(
                controller: textcontroller,
                decoration: InputDecoration(
                    hintText: 'Nhập bình luận',
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.send_rounded,
                        color: AppColor.theme,
                      ),
                      onPressed: () async {
                        bool bl;
                        bl = await BinhLuan_MV.postBinhLuan(
                            widget.id_baiviet.toString(),
                            user.user!.id.toString(),
                            textcontroller.text);
                        if (bl == true) {
                          textcontroller.clear();
                          setState(() {
                            textcontroller;
                          });
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => BinhLuan_Page(
                                        id_baiviet: widget.id_baiviet,
                                        id_lophp: widget.id_lophp,
                                      )),
                              (route) => false);
                        }
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            )
          ],
        ),
      ),
      idlop: widget.id_lophp,
    );
  }
}
