import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Model/ThongKeDiemM.dart';
import 'package:user_flutter/Model_View/ThongKeMV.dart';
import 'package:user_flutter/View/Widget/ThongKe/trangThaiTK.dart';
import 'package:user_flutter/View/Widget/textRick.dart';
import 'package:user_flutter/View/Widget/widget_loadin.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import 'package:user_flutter/provider/link_url.dart';

class ThongKeDiem extends StatefulWidget {
  int idbktra;
  ThongKeDiem({Key? key, required this.idbktra}) : super(key: key);

  @override
  State<ThongKeDiem> createState() => _ThongKeDiemState();
}

class _ThongKeDiemState extends State<ThongKeDiem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: US_APP_COLOR,
          centerTitle: true,
          title: Text('Bảng điểm',
              style: GoogleFonts.quicksand(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          elevation: 0,
          shadowColor: Color.fromARGB(0, 244, 67, 54),
        ),
        body: FutureBuilder<ThongKeDiem_M?>(
          future: ThongKeMV.getThongKeDiem(widget.idbktra),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DataDiem> diem = snapshot.data!.data!;
              DataBaiktra bktra = snapshot.data!.databaiktra![0];
              return CustomScrollView(
                key: centerKey,
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '${bktra.tieuDe}',
                                style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                '${bktra.noiDung}',
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                'Thời gian bắt đầu: ' + bktra.tgBatDau!,
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                'Thời gian kết thúc: ' + bktra.tgKetThuc!,
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Giảng viên ra đề: ',
                                style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                'Tên: ${bktra.hoTen}',
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                'Email: ${bktra.email}',
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
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
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 20, right: 20),
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Thông tin sinh viên:',
                                style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: TextRick(
                                td: 'Tên: ',
                                txt: diem[index].sinhvien!.hoTen!,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: TextRick(
                                td: 'Mã số sinh viên: ',
                                txt: diem[index].sinhvien!.maSo!,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: TextRick(
                                td: 'Email: ',
                                txt: diem[index].sinhvien!.email!,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: TextRick(
                                td: 'Điểm: ',
                                txt: diem[index].tongDiem!.toString(),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TrangThaiTK(
                                  type: diem[index].trangThai!,
                                ),
                              ],
                            )
                          ]),
                    );
                  }, childCount: diem.length)),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: diem.length != 0
                            ? InkWell(
                                onTap: () {
                                  print(
                                      'link: $Link/api/traloi/exportDiemSV?baikt=${bktra.id}&lophp=${bktra.idLopHocPhan}');

                                  linkUrl.openLink(
                                      url:
                                          '$Link/api/traloi/exportDiemSV?baikt=${diem[0].idBaiKiemTra}&lophp=${bktra.idLopHocPhan}');
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
                              )
                            : null)
                  ]))
                ],
              );
            } else {
              return Loading();
            }
          },
        ));
  }
}
