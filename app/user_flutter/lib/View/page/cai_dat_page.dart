import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../Widget/Navi/navigation_drawer_widget.dart';
import '../common/constant/color.dart';

class Cai_Dat_Page extends StatefulWidget {
  const Cai_Dat_Page({Key? key}) : super(key: key);

  @override
  State<Cai_Dat_Page> createState() => _Cai_Dat_PageState();
}

class _Cai_Dat_PageState extends State<Cai_Dat_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.grey2,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu_rounded,
              color: AppColor.theme,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        backgroundColor: AppColor.grey2,
      ),
      body: Container(
        color: AppColor.grey2,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Cài đặt",
                  style: GoogleFonts.quicksand(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: AppColor.theme),
                ),
                Image.asset(
                  "assets/images/png/logo_app.png",
                  width: 170,
                  height: 170,
                ),
              ],
            ),
            ListTile(
              title: Text(
                "Thông tin",
                style:
                    GoogleFonts.quicksand(color: Colors.black, fontSize: 25.0),
              ),
              trailing: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColor.theme),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                ),
                child: Text(
                  "Sửa",
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.theme,
                  borderRadius: BorderRadius.circular(25.0)),
              padding:
                  const EdgeInsets.only(left: 20, bottom: 40, top: 10, right: 20),
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      "Tên người dùng:",
                      style: GoogleFonts.quicksand(
                          color: Colors.black, fontSize: 20.0),
                    ),
                    title: Text(
                      'ho trn6',
                      style: GoogleFonts.quicksand(
                          color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    color: Colors.white,
                    height: 2,
                    width: double.infinity,
                  ),
                  ListTile(
                    leading: Text(
                      "Địa chỉ Email:",
                      style: GoogleFonts.quicksand(
                          color: Colors.black, fontSize: 20.0),
                    ),
                    title: Text(
                      'Email của người dùng',
                      style: GoogleFonts.quicksand(
                          color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    color: Colors.white,
                    height: 2,
                    width: double.infinity,
                  ),
                  ListTile(
                    leading: Text(
                      "SDT:",
                      style: GoogleFonts.quicksand(
                          color: Colors.black, fontSize: 20.0),
                    ),
                    title: Text(
                      "Số điện thoại",
                      style: GoogleFonts.quicksand(
                          color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    color: Colors.white,
                    height: 2,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Chế độ riêng tư",
                      style: GoogleFonts.quicksand(
                          color: Colors.black, fontSize: 25.0),
                    ),
                    // AdvancedSwitch(
                    //   activeChild: SvgPicture.asset(
                    //     "assets/imgs/svg/thay.svg",
                    //     color: Colors.white,
                    //   ),
                    //   inactiveChild: SvgPicture.asset(
                    //       "assets/imgs/svg/khongthay.svg",
                    //       color: Colors.white),
                    //   activeColor: AppColor.theme,
                    //   inactiveColor: AppColor.theme,
                    //   width: 60,
                    //   controller: controller1,
                    // ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 300, right: 30),
              color: Colors.black,
              height: 2,
              width: double.infinity,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Đổi mật khẩu",
                          style: GoogleFonts.quicksand(
                              color: Colors.black, fontSize: 25.0))
                    ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 300, right: 30),
              color: Colors.black,
              height: 2,
              width: double.infinity,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: Text("Đăng xuất",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25.0)),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColor.theme),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
