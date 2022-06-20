import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/dimen.dart';
import 'package:user_flutter/View/page/crate_task.dart';

Future showBottomDialog(BuildContext context) {
  String dropdownValue = 'One';
  TextEditingController textController1 = new TextEditingController();
  TextEditingController textController2 = new TextEditingController();
  return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: getHeightSize(context) * 1 / 3,
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Tạo bài tập',
                  style: GoogleFonts.quicksand(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TaoPostWidget()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.assignment_outlined,
                        size: 30,
                      ),
                      Text(
                        'Bài tập trắc nghiệm',
                        style: GoogleFonts.quicksand(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.file_copy_outlined,
                        size: 30,
                      ),
                      Text('Bài tập tự luận',
                          style: GoogleFonts.quicksand(fontSize: 20))
                    ],
                  ),
                ),
              ),
              Container(
                height: 0.5,
                margin: EdgeInsets.only(
                  top: 20,
                ),
                width: double.infinity,
                color: US_APP_LINE,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.difference_outlined,
                        size: 30,
                      ),
                      Text('Tài liệu',
                          style: GoogleFonts.quicksand(fontSize: 20))
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
