import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;
  final double top;
  final double bottom;
  final double left;
  final double right;

  const ButtonWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onClicked,
      required this.top,
      required this.bottom,
      required this.left,
      required this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        child: buildContent(),
        onTap: onClicked,
      );

  Widget buildContent() => Container(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 20,
            ),
            Icon(icon, size: 22, color: Colors.white),
            const SizedBox(width: 16),
            Text(
              text,
              style: ggTextStyle(17, FontWeight.bold, AppColor.white),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      );
}
