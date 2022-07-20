import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class FloatingBtun extends StatefulWidget {
  String text;
  void Function() onPressed;
  FloatingBtun({Key? key,required this.text,required this.onPressed}) : super(key: key);

  @override
  State<FloatingBtun> createState() => _FloatingBtunState();
}

class _FloatingBtunState extends State<FloatingBtun> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColor.theme,
      label: Text(
        widget.text,
        style: GoogleFonts.quicksand(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: widget.onPressed,
      tooltip: 'Increment',
      //foregroundColor: Colors.yellow,
      //backgroundColor: Colors.red,
      //elevation: 0.0,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
