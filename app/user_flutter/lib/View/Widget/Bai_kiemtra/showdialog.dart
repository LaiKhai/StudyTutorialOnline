import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:user_flutter/Model/User_login.dart';
import 'package:user_flutter/View/Widget/Bai_kiemtra/thongTin.dart';
import 'package:user_flutter/View/Widget/Home/app_icon_buttton.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/dimen.dart';
import 'package:user_flutter/View/controller/tao_bai.dart';
import 'package:user_flutter/View/page/Form_tao_Bktra.dart';
import 'package:user_flutter/View/page/crate_task.dart';

import '../../../Model/cTiet_LopHP.dart';
import '../../controller/tracNghiemController.dart';

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
