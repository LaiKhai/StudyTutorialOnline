import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/dimen.dart';
import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:flutter/material.dart';

import '../widget/InputForm.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
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
            padding:
                EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 20, 0, 0),
            width: getWidthSize(context),
            child: Text(
              'Thông Báo',
              style: ggTextStyle(40, FontWeight.bold, AppColor.theme),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 20,
                getWidthSize(context) * 0.05, 20),
            height: 5,
            width: getWidthSize(context),
            color: AppColor.theme,
          ),
          FormInput(
              isRead: false,
              txtController: _titleController,
              title: 'Tiêu đề',
              hinttext: 'nhập tiêu đề...',
              labeltext: 'tiêu đề',
              preIcon: Icons.turned_in_outlined),
          FormInput(
              isRead: false,
              txtController: _contentController,
              title: 'Loại bài viết',
              hinttext: 'nhập loại bài viết...',
              labeltext: 'Loại bài viết',
              preIcon: Icons.menu_book_outlined),
          Container(
            margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 10,
                getWidthSize(context) * 0.05, 10),
            width: getWidthSize(context),
            child: Text(
              'Nội dung',
              style: ggTextStyle(13, FontWeight.bold, AppColor.black),
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.05, 3,
                getWidthSize(context) * 0.05, 20),
            width: getWidthSize(context),
            child: TextField(
              maxLines: null,
              expands: true,
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: AppColor.theme)),
              ),
            ),
          )),
          Container(
            margin: EdgeInsets.fromLTRB(getWidthSize(context) * 0.06, 0,
                getWidthSize(context) * 0.06, 10),
            width: getWidthSize(context),
            child: Row(
              children: [
                Container(
                    width: getWidthSize(context) * 0.4,
                    height: getHeightSize(context) * 0.06,
                    child: TextButton(
                      child: Text(
                        'Hủy',
                        style: ggTextStyle(20, FontWeight.bold, AppColor.black),
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: AppColor.black, width: 2)))),
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(
                        getWidthSize(context) * 0.08, 0, 0, 0),
                    width: getWidthSize(context) * 0.4,
                    height: getHeightSize(context) * 0.06,
                    child: ElevatedButton(
                      child: Text(
                        'Đăng',
                        style: ggTextStyle(20, FontWeight.bold, AppColor.white),
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(AppColor.theme),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                    ))
              ],
            ),
          )
        ]),
      )),
    );
  }
}
