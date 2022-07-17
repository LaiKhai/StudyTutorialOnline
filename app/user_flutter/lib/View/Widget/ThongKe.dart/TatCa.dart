import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Model/SinhVienLamKtraM.dart';
import 'package:user_flutter/Model_View/bai_Ktra.dart';
import 'package:user_flutter/View/Widget/Home/app_icon_buttton.dart';
import 'package:user_flutter/View/Widget/widget_loadin.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/string.dart';

class DanhSachSV extends StatefulWidget {
  int tt;
  int idbaiktra;
  DanhSachSV({Key? key, this.tt = 0, required this.idbaiktra})
      : super(key: key);

  @override
  State<DanhSachSV> createState() => _DanhSachSVState();
}

class _DanhSachSVState extends State<DanhSachSV> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DanhSachLamKtraM?>(
        future: BaiKiemTraVM.Get_DSSVChualam(widget.idbaiktra, widget.tt),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dsSinhVien> dssv = snapshot.data!.data!;
            return ListView.builder(
                itemCount: dssv.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(360),
                          child: Image.network(
                            dssv[index].avt == null
                                ? 'http://210.2.86.140/assets/images/no_image.png'
                                : "$Link/stogare/${dssv[index].avt}",
                            width: 40,
                            height: 40,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dssv[index] == null
                                    ? 'Sinh Viên'
                                    : dssv[index].hoTen!, //tên sinh viên
                                style: GoogleFonts.quicksand(
                                  color: AppColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                dssv[index].email == null
                                    ? "sinhvien@caothang.edu.vn"
                                    : dssv[index].email!, //email sinh viên
                                style: GoogleFonts.quicksand(
                                  color: AppColor.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        AppIconButton(
                          icon: const Icon(Icons.chevron_right,
                              size: 24, color: AppColor.grey),
                          onTap: () {},
                        ),
                      ],
                    ),
                  );
                }));
          } else {
            return Loading();
          }
        });
  }
}
