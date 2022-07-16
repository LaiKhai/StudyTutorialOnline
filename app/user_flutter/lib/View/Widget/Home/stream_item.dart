// ignore_for_file: unnecessary_new, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:user_flutter/Model/bai_Viet.dart';
import 'package:user_flutter/Model/model_reing/model_bV.dart';
import 'package:user_flutter/View/Widget/Home/show_File.dart';
import 'package:user_flutter/View/Widget/Home/stream_type.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/dimen.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import 'package:user_flutter/View/page/Binh_luan.dart';
import 'package:user_flutter/View/page/Chi_tiet_bai_tap.dart';

class StreamItem extends StatelessWidget {
  final Data bv;
  StreamItem({Key? key, required this.bv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bViet baiviet;
    if (bv.idGiangVien != null) {
      baiviet = new bViet(
          Ng_viet: bv.giangvien!.hoTen!,
          NoiDung: bv.noiDung!,
          avt: bv.giangvien!.avt!,
          time_viet: DateTime.parse(bv.createdAt!),
          Type: bv.idLoaiBaiViet!);
    } else {
      baiviet = new bViet(
          Ng_viet: bv.sinhvien!.hoTen!,
          NoiDung: bv.noiDung!,
          avt: bv.sinhvien!.avt!,
          time_viet: DateTime.parse(bv.createdAt!),
          Type: bv.idLoaiBaiViet!);
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x34090F13),
            offset: Offset(0, 2),
          )
        ],
        color: Colors.white,
        border: Border.all(color: const Color(0xFFdcdcdc), width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (baiviet.Type == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Chi_tiet_Page(
                            baiviet: bv,
                          )),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   stream.type == SubjectStreamType.material
                  //       ? "assets/icons/material.svg"
                  //       : "assets/icons/quiz.svg",
                  //   color: AppColor.white,
                  //   width: 24,
                  //   height: 24,
                  // ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(baiviet.avt),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          baiviet.Ng_viet,
                          style: GoogleFonts.quicksand(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          DateFormat("MMM dd").format(baiviet.time_viet),
                          style: GoogleFonts.quicksand(
                            color: AppColor.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Type
                  StreamType(type: baiviet.Type),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(baiviet.NoiDung),
          ),
          SizedBox(
            height: bv.files!.length == 0
                ? 0 * (getHeightSize(context) / 10)
                : (getHeightSize(context) / 10) * (bv.files!.length + 0.4),
            child: ListView.builder(
                itemCount: bv.files!.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  Files file = bv.files![index];
                  return InkWell(
                    onTap: () {
                      print('object');
                    },
                    child: Container(
                      width: getWidthSize(context) * 0.2 / 5,
                      height: getHeightSize(context) / 10,
                      margin: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: US_APP_LINE,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: getWidthSize(context) / 5,
                              height: getWidthSize(context) / 4.5,
                              decoration: const BoxDecoration(
                                color: AppColor.grey,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                              ),
                              child: Center(child: ShowFile(file: file)),
                            ),
                          ),
                          Container(
                            height: getHeightSize(context) / 10,
                            color: US_APP_LINE,
                            width: 1,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            height: getWidthSize(context) / 4.5,
                            width: getWidthSize(context) * 2.8 / 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  file.tenFile!,
                                  style: GoogleFonts.quicksand(
                                    color: const Color(0xFF57636C),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  file.loaiFile!,
                                  style: GoogleFonts.quicksand(
                                    color: const Color(0xFF57636C),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: const Color(0xFFdcdcdc),
          ),
          InkWell(
            splashColor: AppColor.white.withOpacity(0.05),
            highlightColor: AppColor.white.withOpacity(0.15),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BinhLuan_Page()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/comment.svg",
                    color: AppColor.grey,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "Add class's comment",
                    style: GoogleFonts.quicksand(
                      color: AppColor.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
