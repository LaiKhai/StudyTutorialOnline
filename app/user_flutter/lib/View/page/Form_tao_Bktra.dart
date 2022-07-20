import 'dart:convert';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Model/createBktra.dart';
import 'package:user_flutter/Model/tao_CauHoi.dart';
import 'package:user_flutter/Model_View/CauHoi.dart';
import 'package:user_flutter/View/Widget/Form_tao.dart/Tao_tra_loi.dart';
import 'package:user_flutter/View/Widget/showNouti.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/dimen.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import 'package:user_flutter/View/page/Bai_Ktra.dart';
import 'package:user_flutter/tse.dart';

class Tao_trac_nghiem extends StatefulWidget {
  Crate_Bktra bktra;
  TextEditingController diemToiDaController = new TextEditingController();
  TextEditingController TieuDeController = new TextEditingController();
  TextEditingController MoTaController = new TextEditingController();

  int SoLuong;
  Tao_trac_nghiem(
      {Key? key,
      required this.MoTaController,
      required this.TieuDeController,
      this.SoLuong = 1,
      required this.bktra,
      required this.diemToiDaController})
      : super(key: key);
  @override
  State<Tao_trac_nghiem> createState() => _Tao_trac_nghiemState();
}

class _Tao_trac_nghiemState extends State<Tao_trac_nghiem> {
  List<String> lst_dropdownValue = [];
  List<TextEditingController> Lst_Cauhoi = [];
  List<List<TextEditingController>> lst_Trl_TracNghiem = [];
  //Khi thay đổi giá trị tổng các giá trị khác sẽ thay đổi
  xetSo() {
    double diem;
    if (widget.diemToiDaController.text == '') {
      diem = 0.0;
    } else {
      diem = double.parse(widget.diemToiDaController.text) / item;
    }

    for (int i = 0; i < item; i++) {
      setState(() {
        lst_Trl_TracNghiem[i][4].text = diem.toString();
      });
    }
  }

  //Thay đổi 1 giá trị dựa trên giá trị tổng đã có và thay đổi giá trị 1 cách đb
  xetDiem() {
    double diem;
    int db = 1; //số lượng số có sự khác biệt
    if (widget.diemToiDaController.text == '') {
      diem = 0.0;
    } else {
      diem = double.parse(widget.diemToiDaController.text) / item;
    }

    for (int i = 0; i < item; i++) {
      if (lst_Trl_TracNghiem[i][4] != diem) {
        double diem2 =
            double.parse(widget.diemToiDaController.text) / (item - db);
        db++;
        for (int j = 0; j < item; j++) {}
      }
      setState(() {
        lst_Trl_TracNghiem[i][4].text = diem.toString();
      });
    }
  }

  tao() {
    if (widget.diemToiDaController.text == '') {
      widget.diemToiDaController.text = '0';
    }
    double diem =
        double.parse(widget.diemToiDaController.text) / widget.SoLuong;
    for (int i = 0; i < widget.SoLuong; i++) {
      TextEditingController cauHoi = new TextEditingController();
      Lst_Cauhoi.add(cauHoi);
      List<TextEditingController> lst_Ctiet_Trl = [];
      TextEditingController AController = new TextEditingController();
      TextEditingController BController = new TextEditingController();
      TextEditingController CController = new TextEditingController();
      TextEditingController DController = new TextEditingController();
      TextEditingController DiemController =
          new TextEditingController(text: diem.toString());
      lst_Ctiet_Trl.add(AController);
      lst_Ctiet_Trl.add(BController);
      lst_Ctiet_Trl.add(CController);
      lst_Ctiet_Trl.add(DController);
      lst_Ctiet_Trl.add(DiemController);
      lst_dropdownValue.add('A');
      setState(() {
        lst_Ctiet_Trl;
        lst_dropdownValue;
      });
      lst_Trl_TracNghiem.add(lst_Ctiet_Trl);
    }
    setState(() {
      Lst_Cauhoi;
    });
  }

  Lay() {
    Cauhoi_Ktra cauhoi_ktra = new Cauhoi_Ktra();
    List<ListCauHoi> lst_cauhoi = [];
    for (int i = 0; i < Lst_Cauhoi.length; i++) {
      ListCauHoi lst = new ListCauHoi();
      lst.idBaiKiemTra = widget.bktra.baikiemtra!.id;
      lst.diem = double.parse(lst_Trl_TracNghiem[i][4].text);
      lst.deBai = Lst_Cauhoi[i].text;
      lst.dapAn1 = lst_Trl_TracNghiem[i][0].text;
      lst.dapAn2 = lst_Trl_TracNghiem[i][1].text;
      lst.dapAn3 = lst_Trl_TracNghiem[i][2].text;
      lst.dapAn4 = lst_Trl_TracNghiem[i][3].text;
      lst.dapAnDung = lst_dropdownValue[i];
      lst.trangThai = 1;
      setState(() {
        lst;
      });
      lst_cauhoi.add(lst);
      setState(() {
        lst_cauhoi;
      });
    }

    cauhoi_ktra.listCauHoi = lst_cauhoi;
    CauHoi.taoCauHoi(cauhoi_ktra, context,
        widget.bktra.baikiemtra!.idLopHocPhan!, widget.bktra);
  }

  bool Checknull() {
    for (int i = 0; i < Lst_Cauhoi.length; i++) {
      if (lst_Trl_TracNghiem[i][0].text.trim() != '' ||
          lst_Trl_TracNghiem[i][1].text.trim() != '' ||
          lst_Trl_TracNghiem[i][2].text.trim() != '' ||
          lst_Trl_TracNghiem[i][3].text.trim() != '' ||
          lst_Trl_TracNghiem[i][4].text.trim() != '' ||
          Lst_Cauhoi[i].text.trim() != '') {
        return false;
      }
    }
    return true;
  }

  TextEditingController controller = new TextEditingController();
  String _verticalGroupValue = "Pending";
  List<String> _status = ["Pending", "Released", "Blocked"];
  int item = 0;
  @override
  void initState() {
    // TODO: implement initState
    tao();
    setState(() {
      item = widget.SoLuong;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColor.theme,
          label: Text(
            'Tạo bài kiểm tra',
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            // if (Checknull() == false) {
            //   showCustomDialog(context,
            //       'Hãy đảm bảo là không có giá trị nào bị trống', false);
            // } else {
            Lay();
            // }

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => Bai_Ktra(
            //             tieuDe: widget.TieuDeController.text,
            //             moTa: widget.MoTaController.text,
            //             Lst_Cauhoi: Lst_Cauhoi,
            //             lst_Trl_TracNghiem: lst_Trl_TracNghiem,
            //           )),
            // );
          },
          tooltip: 'Increment',
          //foregroundColor: Colors.yellow,
          //backgroundColor: Colors.red,
          //elevation: 0.0,
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        body: CustomScrollView(
          key: centerKey,
          slivers: <Widget>[
            SliverList(
                key: centerKey,
                delegate: SliverChildListDelegate([
                  Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      padding: EdgeInsets.only(
                          bottom: 20, left: 20, right: 20, top: 20),
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
                          TextFormField(
                            controller: widget.TieuDeController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Tiêu đề:',
                              labelStyle: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: US_APP_COLOR,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: US_APP_COLOR,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 32, 20, 12),
                            ),
                            style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                            textAlign: TextAlign.start,
                            maxLines: null,
                            maxLength: 150,
                          ),
                          TextFormField(
                            controller: widget.MoTaController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Mô tả chi tiết',
                              labelStyle: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: US_APP_COLOR,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: US_APP_COLOR,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 32, 20, 12),
                            ),
                            style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            textAlign: TextAlign.start,
                            maxLines: null,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Tổng điểm: ',
                                  style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(8.0),
                                width: getWidthSize(context) * 1 / 6,
                                height: getWidthSize(context) * 1 / 6,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'textController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {
                                      xetSo();
                                    }),
                                  ),
                                  controller: widget.diemToiDaController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: US_APP_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: US_APP_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  style: GoogleFonts.quicksand(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ])),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                padding:
                    EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Câu ' + (index + 1).toString() + ':',
                            style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Điểm:',
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Container(
                              width: getWidthSize(context) * 1 / 7,
                              height: getWidthSize(context) * 1 / 7,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: lst_Trl_TracNghiem[index][4],
                                obscureText: false,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: US_APP_COLOR,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: US_APP_COLOR,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                style: GoogleFonts.quicksand(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                                textAlign: TextAlign.start,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: Lst_Cauhoi[index],
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Câu hỏi:',
                          labelStyle: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: US_APP_COLOR,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: US_APP_COLOR,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                        ),
                        style: GoogleFonts.quicksand(),
                        textAlign: TextAlign.start,
                        maxLines: null,
                        maxLength: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        'Đáp án',
                        style: GoogleFonts.quicksand(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Tao_Trloi_TN(
                        controller: lst_Trl_TracNghiem[index][0], name: 'A'),
                    Tao_Trloi_TN(
                        controller: lst_Trl_TracNghiem[index][1], name: 'B'),
                    Tao_Trloi_TN(
                        controller: lst_Trl_TracNghiem[index][2], name: 'C'),
                    Tao_Trloi_TN(
                        controller: lst_Trl_TracNghiem[index][3], name: 'D'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Đáp án đúng:',
                            style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: US_APP_COLOR, width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: DropdownButton<String>(
                              value: lst_dropdownValue[index],
                              elevation: 16,
                              style: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              onChanged: (String? newValue) {
                                setState(() {
                                  lst_dropdownValue[index] = newValue!;
                                });
                              },
                              items: <String>[
                                'A',
                                'B',
                                'C',
                                'D'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }, childCount: item)),
            SliverList(
                delegate: SliverChildListDelegate([
              InkWell(
                onTap: () {
                  TextEditingController cauHoi = new TextEditingController();

                  Lst_Cauhoi.add(cauHoi);
                  List<TextEditingController> lst_Ctiet_Trl = [];
                  TextEditingController AController =
                      new TextEditingController();
                  TextEditingController BController =
                      new TextEditingController();
                  TextEditingController CController =
                      new TextEditingController();
                  TextEditingController DController =
                      new TextEditingController();
                  TextEditingController DiemController =
                      new TextEditingController();
                  lst_Ctiet_Trl.add(AController);
                  lst_Ctiet_Trl.add(BController);
                  lst_Ctiet_Trl.add(CController);
                  lst_Ctiet_Trl.add(DController);
                  lst_Ctiet_Trl.add(DiemController);
                  lst_dropdownValue.add('A');
                  setState(() {
                    item++;
                    cauHoi;
                    lst_Ctiet_Trl;
                  });
                  lst_Trl_TracNghiem.add(lst_Ctiet_Trl);
                  xetSo();
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: 400,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3192D3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                        child: Container(
                      child: Text(
                        'Thêm Điều Khoản',
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25),
                      ),
                    )),
                  ),
                ),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
