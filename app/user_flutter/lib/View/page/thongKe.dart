import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:user_flutter/View/Widget/Home/app_icon_buttton.dart';
import 'package:user_flutter/View/Widget/ThongKe.dart/TatCa.dart';
import 'package:user_flutter/View/Widget/ThongKe.dart/floatingBton.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/dimen.dart';

class ThongKePage extends StatefulWidget {
  const ThongKePage({Key? key}) : super(key: key);

  @override
  State<ThongKePage> createState() => _ThongKePageState();
}

class _ThongKePageState extends State<ThongKePage> {
  List<Widget> bodies = [
    DanhSachSV(tt: 0),
    DanhSachSV(tt: 1),
    DanhSachSV(tt: 2),
  ];
  final List<Map<String, dynamic>> menus = [
    {'index': 1, 'icon': Icons.alarm_off_outlined, 'title': "Chưa hoàn thành"},
    {'index': 2, 'icon': Icons.alarm_on_outlined, 'title': "Đa hoàn thành"},
    {'index': 3, 'icon': Icons.group_outlined, 'title': "tất cả"},
  ];
  int _activeIndex = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: CustomScrollView(slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '0',
                        style: GoogleFonts.quicksand(
                            fontSize: 40, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Đã nộp',
                        style: GoogleFonts.quicksand(
                            fontSize: 25, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  color: US_APP_LINE,
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '0',
                        style: GoogleFonts.quicksand(
                            fontSize: 40, fontWeight: FontWeight.w700),
                      ),
                      Text('Đã giao',
                          style: GoogleFonts.quicksand(
                              fontSize: 25, fontWeight: FontWeight.normal)),
                    ],
                  ),
                )
              ],
            ),
            GNav(
              selectedIndex: _activeIndex,
              curve: Curves.easeInOutQuint,
              duration: const Duration(milliseconds: 300),
              haptic: true,
              gap: 8,
              tabMargin: const EdgeInsets.symmetric(horizontal: 8),
              color: AppColor.grey,
              activeColor: _activeIndex == 0 ? Colors.red : US_APP_COLOR,
              tabBackgroundColor: _activeIndex == 0
                  ? Colors.red.withOpacity(0.25)
                  : US_APP_COLOR.withOpacity(0.25),
              onTabChange: (index) {
                setState(() {
                  _activeIndex = index;

                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutQuint,
                  );
                });
              },
              tabs: menus
                  .map(
                    (menu) => GButton(
                      gap: 8,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      icon: menu['icon'],
                      text: menu['title'],
                      textStyle: GoogleFonts.quicksand(
                        color: _activeIndex == 0 ? Colors.red : US_APP_COLOR,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ])),
          SliverToBoxAdapter(
            child: SizedBox(
              height: getHeightSize(context) * 4 / 5,
              child: PageView.builder(
                  controller: pageController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _activeIndex = index;
                    });
                  },
                  itemCount: 3,
                  itemBuilder: (ctx, index) => bodies[index]),
            ),
          ),
        ]),
        floatingActionButton: FloatingBtun(
            text: 'Bắt đầu kiểm tra',
            onPressed: () {
              print('bắt đầu ktra');
            }));
  }
}
