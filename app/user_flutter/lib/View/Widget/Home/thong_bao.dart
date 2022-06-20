import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/dimen.dart';

class ItemModel {
  String title;
  IconData icon;

  ItemModel(this.title, this.icon);
}

class thong_bao extends StatefulWidget {
  const thong_bao({Key? key}) : super(key: key);

  @override
  State<thong_bao> createState() => _thong_baoState();
}

class _thong_baoState extends State<thong_bao> {
  CustomPopupMenuController _controller = CustomPopupMenuController();
  @override
  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      child: Container(
        child: SvgPicture.asset(
          "assets/icons/notification-fill.svg",
          width: 24,
          height: 24,
          color: Colors.white,
        ),
      ),
      menuBuilder: () => ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: IntrinsicWidth(
            child: SizedBox(
              height: getHeightSize(context) / 2,
              child: ListView.builder(itemBuilder: (context, index) {
                return Column(children: [
                  ListTile(
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
                          color: US_APP_COLOR_2),
                    ),
                    subtitle: Text(
                      'Nội dung dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài dài',
                      style: GoogleFonts.quicksand(
                          fontSize: 15, color: US_APP_COLOR_2),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Container(
                    height: 0.5,
                    width: double.infinity,
                    color: Color(0xFFdcdcdc),
                  )
                ]);
              }),
            ),
          ),
        ),
      ),
      pressType: PressType.singleClick,
      controller: _controller,
    );
  }
}
