import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:user_flutter/Model/User_login.dart';
import 'package:user_flutter/Model/listBaiKtra_model.dart';
import 'package:user_flutter/Model/model_reing/BaiTapModel.dart';
import 'package:user_flutter/View/Widget/Home/assignment_status.dart';
import 'package:user_flutter/View/Widget/showNouti.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/page/Bai_Ktra.dart';
import 'package:user_flutter/View/page/thongKe.dart';

class AssignmentItem extends StatelessWidget {
  final BaiTapModel baikiemtra;
  AssignmentItem({Key? key, required this.baikiemtra}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x34090F13),
            offset: Offset(0, 2),
          )
        ],
        border: Border.all(color: Color(0xFFdcdcdc), width: 1.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              if (user.user!.idChucVu != 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ThongKePage(
                            idBktra: baikiemtra.id,
                          )),
                );
              } else {
                if (baikiemtra.type == 1 || baikiemtra.type == 3) {
                  showCustomDialog(
                      context,
                      'Kết quả của bạn là: ' + baikiemtra.diem.toString(),
                      true);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Bai_Ktra(
                              id: baikiemtra.id,
                            )),
                  );
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/svg/test.svg",
                        color: AppColor.white,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              baikiemtra.tieuDe,
                              style: GoogleFonts.quicksand(
                                fontSize: 20,
                                color: AppColor.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Due at " +
                                  DateFormat("MMM dd").format(
                                      DateTime.parse(baikiemtra.createAt)),
                              style: GoogleFonts.quicksand(
                                color: AppColor.grey,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      baikiemtra.noiDung,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.quicksand(
                        color: AppColor.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AssignmentStatus(type: baikiemtra.type),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // InkWell(
          //   splashColor: AppColor.white.withOpacity(0.05),
          //   highlightColor: AppColor.white.withOpacity(0.15),
          //   borderRadius: const BorderRadius.only(
          //     bottomLeft: Radius.circular(15),
          //     bottomRight: Radius.circular(15),
          //   ),
          //   onTap: () {
          //     print('object');
          //   },
          //   child: Container(
          //     padding: const EdgeInsets.all(12),
          //     decoration: const BoxDecoration(
          //       border: Border.symmetric(
          //         horizontal: BorderSide(
          //           color: Color(0xFFdcdcdc),
          //         ),
          //       ),
          //     ),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         SvgPicture.asset(
          //           "assets/icons/comment.svg",
          //           color: AppColor.grey,
          //           width: 16,
          //           height: 16,
          //         ),
          //         const SizedBox(width: 16),
          //         Text(
          //           "Add class's comment",
          //           style: GoogleFonts.quicksand(
          //             color: AppColor.grey,
          //             fontSize: 12,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
