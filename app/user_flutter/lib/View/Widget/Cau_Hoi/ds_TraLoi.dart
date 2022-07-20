import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:user_flutter/Model/traLoiauHoi_M.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/string.dart';

class DanhSachTrl extends StatefulWidget {
  traLoiCauHoi_M listTraloi;
  DanhSachTrl({Key? key, required this.listTraloi}) : super(key: key);

  @override
  State<DanhSachTrl> createState() => _DanhSachTrlState();
}

class _DanhSachTrlState extends State<DanhSachTrl> {
  PageController pageViewController = new PageController();
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      Tt_TraLoi tt_traLoi = widget.listTraloi.data![index];
      return Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
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
        child: // Generated code for this Column Widget...
            Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tt_traLoi.hoTen != null ? tt_traLoi.hoTen! : 'tên',
                    style: GoogleFonts.quicksand(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () async {},
                    child: Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      // ignore: dead_code
                      child: tt_traLoi.avt != null
                          ? Image.network('$Link/stogare${tt_traLoi.avt}')
                          : Image.asset(
                              'assets/images/student_2.png',
                            ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                    child: Text(
                      tt_traLoi.cauTraLoi != null
                          ? tt_traLoi.cauTraLoi!
                          : 'trả lời',
                      style: GoogleFonts.quicksand(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 130,
                      child: Stack(
                        children: [
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 20),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 8, 8, 8),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      const BoxShadow(
                                        blurRadius: 5,
                                        color: Color(0x32000000),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 16),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.folder_special_rounded,
                                          color: US_APP_COLOR,
                                          size: 48,
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(16, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                tt_traLoi.tenFile != null
                                                    ? tt_traLoi.tenFile!
                                                    : 'tên file',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  tt_traLoi.loaiFile != null
                                                      ? tt_traLoi.loaiFile!
                                                      : 'loại file',
                                                  style: GoogleFonts.quicksand(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }, childCount: widget.listTraloi.data!.length));
  }
}
