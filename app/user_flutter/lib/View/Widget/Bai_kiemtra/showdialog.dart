import 'package:flutter/material.dart';

import 'package:user_flutter/View/Widget/Bai_kiemtra/thongTin.dart';

import '../../../Model/cTiet_LopHP.dart';

Future showBottomDialog(BuildContext context, Lophocphan lop_HP) {
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
        return Thong_tin(lop_HP: lop_HP);
      });
}
