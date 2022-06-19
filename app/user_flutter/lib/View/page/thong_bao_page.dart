import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/Widget/Navi/navigation_drawer_widget.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class ItemModel {
  String title;
  IconData icon;

  ItemModel(this.title, this.icon);
}

class Thong_Bao_Page extends StatefulWidget {
  const Thong_Bao_Page({Key? key}) : super(key: key);

  @override
  State<Thong_Bao_Page> createState() => _Thong_Bao_PageState();
}

class _Thong_Bao_PageState extends State<Thong_Bao_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        backgroundColor: AppColor.grey2,
        appBar: AppBar(
          backgroundColor: AppColor.theme,
          title: Text(
            'Thông báo',
            style: GoogleFonts.quicksand(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(child: ListView.builder(itemBuilder: (context, index) {
          return Column(children: [
            Container(
              // margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: AppColor.grey,
                  backgroundImage: NetworkImage(
                      'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg'),
                ),
                title: Text(
                  'Tên lớp',
                  style: GoogleFonts.quicksand(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                subtitle: Text(
                  'Nội dung dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài',
                  style:
                      GoogleFonts.quicksand(fontSize: 15, color: Colors.black),
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
            Container(
              height: 0.5,
              width: double.infinity,
              color: Color(0xFFdcdcdc),
            )
          ]);
        })),
      ),
    );
  }
}
