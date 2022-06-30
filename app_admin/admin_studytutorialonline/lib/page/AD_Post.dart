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
        width: getWidthSize(context),
        height: getHeightSize(context),
        child: Column(children: [
          Container(
            child: Text(
              'Thông Báo',
              style: ggTextStyle(20, FontWeight.bold, AppColor.theme),
              textAlign: TextAlign.left,
            ),
          )
        ]),
      )),
    );
  }
}
