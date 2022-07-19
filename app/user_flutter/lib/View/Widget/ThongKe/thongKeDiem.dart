import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/View/Widget/ThongKe/trangThaiTK.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import 'package:user_flutter/provider/link_url.dart';

class ThongKeDiem extends StatefulWidget {
  const ThongKeDiem({Key? key}) : super(key: key);

  @override
  State<ThongKeDiem> createState() => _ThongKeDiemState();
}

class _ThongKeDiemState extends State<ThongKeDiem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        key: centerKey,
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tiêu dề:',
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Text(
                      'Mô tả: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      'Thời gian bắt đầu: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      'Thời gian kết thúc: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      'Giảng viên ra đề: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Text(
                      'Tên giảng viên: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      'Email: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Bảng điểm:',
                style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
          ])),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return // Generated code for this ProPlan Widget...
                Container(
              margin: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 20),
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x34090F13),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thông tin sinh viên:',
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Text(
                      'Tên: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      'Mã số sinh viên: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      'Email: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      'Điểm: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        TrangThaiTK(
                          type: 1,
                        ),
                      ],
                    )
                  ]),
            );
          }, childCount: 5)),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: InkWell(
                onTap: () {
                  linkUrl.openLink(
                      url: '$Link/api/traloi/exportDiemSV?bkt=5&lop=1');
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Xuất bảng điểm',
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x34090F13),
                        offset: Offset(0, 2),
                      ),
                    ],
                    color: US_APP_COLOR,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            )
          ]))
        ],
      ),
    );
  }
}
