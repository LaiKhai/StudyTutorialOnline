import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:user_flutter/Model/User_login.dart';
import 'package:user_flutter/View/Widget/Home/app_icon_buttton.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/dimen.dart';
import 'package:user_flutter/View/controller/tao_bai.dart';
import 'package:user_flutter/View/page/Form_tao_Bktra.dart';
import 'package:user_flutter/View/page/crate_task.dart';

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
        return Container(
          height: getHeightSize(context) * 1 / 3,
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Tạo bài tập',
                  style: GoogleFonts.quicksand(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {
                  showBarModalBottomSheet(
                    context: context,
                    animationCurve: Curves.easeInOut,
                    backgroundColor: Theme.of(context).canvasColor,
                    bounce: true,
                    enableDrag: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )),
                    builder: (ctx) => SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x34090F13),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 0),
                                      child: TextFormField(
                                        controller: userNameController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Tiêu đề',
                                          labelStyle: GoogleFonts.quicksand(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: US_APP_COLOR,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: US_APP_COLOR,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 32, 20, 12),
                                        ),
                                        style: GoogleFonts.quicksand(),
                                        textAlign: TextAlign.start,
                                        maxLines: null,
                                        maxLength: 150,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 0),
                                      child: TextFormField(
                                        controller: shortBioController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText:
                                              'Hướng dẫn chi tiết (không bắt buộc)...',
                                          hintStyle: GoogleFonts.quicksand(),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: US_APP_COLOR,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: US_APP_COLOR,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 32, 20, 12),
                                        ),
                                        style: GoogleFonts.quicksand(),
                                        textAlign: TextAlign.start,
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 0),
                                      child: TextFormField(
                                        controller: userNameController,
                                        keyboardType: TextInputType.number,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Số câu hỏi',
                                          labelStyle: GoogleFonts.quicksand(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: US_APP_COLOR,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: US_APP_COLOR,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 32, 20, 12),
                                        ),
                                        style: GoogleFonts.quicksand(),
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 0),
                                      child: TextFormField(
                                        controller: userNameController,
                                        keyboardType: TextInputType.number,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Điểm tối đa',
                                          labelStyle: GoogleFonts.quicksand(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: US_APP_COLOR,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: US_APP_COLOR,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 32, 20, 12),
                                        ),
                                        style: GoogleFonts.quicksand(),
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 32),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(360),
                                        child: Image.network(
                                          "https://www.looper.com/img/gallery/20-epic-movies-like-avatar-you-need-to-watch-next/l-intro-1645555067.jpg",
                                          width: 32,
                                          height: 32,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            lop_HP.lop!.tenLop.toString(),
                                            style: GoogleFonts.quicksand(
                                              color: AppColor.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            lop_HP.bomon!.tenMonHoc!,
                                            style: GoogleFonts.quicksand(
                                              color: AppColor.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  AppIconButton(
                                    icon: Icon(
                                      Icons.chevron_right,
                                      color: AppColor.grey.withOpacity(0.75),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              const SizedBox(height: 32),
                              MaterialButton(
                                minWidth: MediaQuery.of(context).size.width,
                                elevation: 0,
                                highlightElevation: 0,
                                splashColor: Theme.of(context)
                                    .canvasColor
                                    .withOpacity(0.15),
                                highlightColor: Theme.of(context)
                                    .canvasColor
                                    .withOpacity(0.25),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 16,
                                ),
                                color: const Color(0xFF71b665),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "Tạo bài trắc nghiệm",
                                  style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  // Do something & close modal
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Tao_trac_nghiem()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.assignment_outlined,
                        size: 30,
                      ),
                      Text(
                        'Bài tập trắc nghiệm',
                        style: GoogleFonts.quicksand(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TaoPostWidget()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.file_copy_outlined,
                        size: 30,
                      ),
                      Text('Bài tập tự luận',
                          style: GoogleFonts.quicksand(fontSize: 20))
                    ],
                  ),
                ),
              ),
              Container(
                height: 0.5,
                margin: EdgeInsets.only(
                  top: 20,
                ),
                width: double.infinity,
                color: US_APP_LINE,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.difference_outlined,
                        size: 30,
                      ),
                      Text('Tài liệu',
                          style: GoogleFonts.quicksand(fontSize: 20))
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
