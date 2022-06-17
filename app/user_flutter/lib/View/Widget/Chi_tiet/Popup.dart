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

class Popupmenu extends StatefulWidget {
  const Popupmenu({Key? key}) : super(key: key);

  @override
  State<Popupmenu> createState() => _PopupmenuState();
}

class _PopupmenuState extends State<Popupmenu> {
  CustomPopupMenuController _controller = CustomPopupMenuController();
  @override
  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      child: Container(
        child: SvgPicture.asset(
          "assets/icons/info.svg",
          width: 24,
          height: 24,
          color: AppColor.white,
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
