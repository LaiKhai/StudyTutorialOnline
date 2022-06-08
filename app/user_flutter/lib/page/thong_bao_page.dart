import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Widget/Navi/navigation_drawer_widget.dart';
import 'package:user_flutter/common/constant/color.dart';

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
          return Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: const BoxDecoration(
              color: Color(0xFFEEEEEE),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  color: AppColor.grey,
                  spreadRadius: 1,
                )
              ],
            ),
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
                    color: AppColor.white),
              ),
              subtitle: Text(
                'Nội dung dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài',
                style:
                    GoogleFonts.quicksand(fontSize: 15, color: AppColor.white),
                overflow: TextOverflow.clip,
              ),
            ),
          );
        })),
      ),
    );
  }
}
