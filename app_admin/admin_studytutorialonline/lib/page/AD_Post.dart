import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/dimen.dart';
import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
            padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
            width: getWidthSize(context),
            child: Text(
              'Thông Báo',
              style: ggTextStyle(40, FontWeight.bold, AppColor.theme),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
            height: 5,
            width: getWidthSize(context),
            color: AppColor.theme,
          )
        ]),
      )),
    );
  }
}
