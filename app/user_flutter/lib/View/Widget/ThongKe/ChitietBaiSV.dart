import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Model/BaiKtrta.dart';
import 'package:user_flutter/Model/Bai_da_luu.dart';
import 'package:user_flutter/Model_View/bai_Ktra.dart';
import 'package:user_flutter/View/Widget/widget_loadin.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/dimen.dart';

class ChitietKtraSV extends StatefulWidget {
  int id;
  int idSv;
  ChitietKtraSV({Key? key, required this.id, required this.idSv})
      : super(key: key);

  @override
  State<ChitietKtraSV> createState() => _ChitietKtraSVState();
}

class _ChitietKtraSVState extends State<ChitietKtraSV> {
  BaiDaLuuModel? baiDaluu = null;
  List<String> a = [];
  List<int> _verticalGroupValue = [];
  List<String> _status = ["Pendings", "Released", "Blocked"];

  getBaidaluu() async {
    BaiDaLuuModel? gets =
        await BaiKiemTraVM.Getbaidaluu(widget.id, widget.idSv);
    setState(() {
      baiDaluu = gets;
    });
  }

  khoitao_Value(int dai) {
    if (baiDaluu != null) {
      for (int i = 0; i < dai; i++) {
        if (baiDaluu!.baikiemtra![i] != null) {
          String da = '';
          switch (baiDaluu!.baikiemtra![i].dapAn!) {
            case 'A':
              _verticalGroupValue.add(0);
              print(i);
              print('A');
              break;
            case 'B':
              _verticalGroupValue.add(1);
              print(i);
              print('B b b b ');
              break;
            case 'C':
              _verticalGroupValue.add(2);
              print(i);
              print('C');
              break;
            case 'D':
              _verticalGroupValue.add(3);
              print(i);
              print(_verticalGroupValue[1]);
              print('D');
              break;
            default:
              _verticalGroupValue.add(5);
          }
        } else {
          _verticalGroupValue.add(5);
        }
      }
    } else {
      for (int i = 0; i < dai; i++) {
        _verticalGroupValue.add(5);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBaidaluu();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CT_Bai_Ktra_model>(
      future: BaiKiemTraVM.Show_BKTra(widget.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Cauhoi> lst_Cauhoi;
          if (snapshot.data == null) {
            lst_Cauhoi = [];
          } else {
            if (snapshot.data!.baikiemtra == null) {
              lst_Cauhoi = [];
            } else {
              lst_Cauhoi = snapshot.data!.baikiemtra!.cauhoi!;
            }
          }

          CT_Baikiemtra ct_baikiemtra = snapshot.data!.baikiemtra!;
          khoitao_Value(lst_Cauhoi.length);
          return Scaffold(
              appBar: AppBar(
                backgroundColor: US_APP_COLOR,
                title: Text(
                  ct_baikiemtra.tieuDe!,
                  style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                centerTitle: true,
              ),
              body: CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                            Text(
                              'Thông tin sinh viên:',
                              style: GoogleFonts.quicksand(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              'Tên: ' + ct_baikiemtra.noiDung!,
                              style: GoogleFonts.quicksand(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ]),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                            Text(
                              'Mô tả:',
                              style: GoogleFonts.quicksand(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              ct_baikiemtra.noiDung!,
                              style: GoogleFonts.quicksand(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ]),
                    ),
                  ])),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      List<String> a = [
                        lst_Cauhoi[index].dapAn1!,
                        lst_Cauhoi[index].dapAn2!,
                        lst_Cauhoi[index].dapAn3!,
                        lst_Cauhoi[index].dapAn4!,
                      ];

                      _status = a;
                      return Column(
                        children: [
                          // Text(
                          //   'Câu hỏi: ' + widget.Lst_Cauhoi[index].text,
                          //   style: TextStyle(color: Colors.black),
                          // ),
                          // Text(
                          //   'A: ' + widget.lst_Trl_TracNghiem[index][0].text,
                          //   style: TextStyle(color: Colors.black),
                          // ),
                          // Text(
                          //   'B: ' + widget.lst_Trl_TracNghiem[index][1].text,
                          //   style: TextStyle(color: Colors.black),
                          // ),
                          // Text(
                          //   'C: ' + widget.lst_Trl_TracNghiem[index][2].text,
                          //   style: TextStyle(color: Colors.black),
                          // ),
                          // Text(
                          //   'D: ' + widget.lst_Trl_TracNghiem[index][3].text,
                          //   style: TextStyle(color: Colors.black),
                          // ),

                          Container(
                            margin:
                                EdgeInsets.only(top: 20, left: 20, right: 20),
                            padding: EdgeInsets.only(
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
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        baiDaluu!.baikiemtra![index].dapAn ==
                                                baiDaluu!.baikiemtra![index]
                                                    .dapAnDung
                                            ? '${baiDaluu!.baikiemtra![index].diem}/${baiDaluu!.baikiemtra![index].diem}'
                                            : '0/${baiDaluu!.baikiemtra![index].diem}',
                                        style: GoogleFonts.quicksand(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Câu ${index + 1}: ' +
                                      lst_Cauhoi[index].deBai!,
                                  style: GoogleFonts.quicksand(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                GroupRadioButton(
                                  label: [
                                    SizedBox(
                                        width: getWidthSize(context) * 2 / 3,
                                        child: Text(
                                          _status[0],
                                          style: GoogleFonts.quicksand(
                                              textStyle: const TextStyle(
                                                  overflow: TextOverflow.clip),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    SizedBox(
                                        width: getWidthSize(context) * 2 / 3,
                                        child: Text(
                                          _status[1],
                                          style: GoogleFonts.quicksand(
                                              textStyle: const TextStyle(
                                                  overflow: TextOverflow.clip),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    SizedBox(
                                        width: getWidthSize(context) * 2 / 3,
                                        child: Text(
                                          _status[2],
                                          style: GoogleFonts.quicksand(
                                              textStyle: const TextStyle(
                                                  overflow: TextOverflow.clip),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    SizedBox(
                                        width: getWidthSize(context) * 2 / 3,
                                        child: Text(
                                          _status[3],
                                          style: GoogleFonts.quicksand(
                                              textStyle: const TextStyle(
                                                  overflow: TextOverflow.clip),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ],
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  spaceBetween: 5,
                                  radioRadius: 10,
                                  color: US_APP_COLOR,
                                  selectedIndex: _verticalGroupValue[index],
                                  onChanged: (listIndex) {
                                    // print(listIndex);
                                    // print('index: ' + index.toString());
                                    // String trl = '';
                                    // if (listIndex == 0) {
                                    //   trl = "A";
                                    // }
                                    // if (listIndex == 1) {
                                    //   trl = "B";
                                    // }
                                    // if (listIndex == 2) {
                                    //   trl = "C";
                                    // }
                                    // if (listIndex == 3) {
                                    //   trl = "D";
                                    // }
                                    // setState(() {
                                    //   trl;
                                    // });
                                    // BaiKiemTraVM.traLoiMotCau(
                                    //     trl,
                                    //     lst_Cauhoi[index].id!,
                                    //     widget.id,
                                    //     baiDaluu!.baikiemtra![index].idTraLoi!);
                                    // setState(() {
                                    //   _verticalGroupValue[index] = listIndex;
                                    // });
                                  },
                                ),
                                // RadioGroup<String>.builder(
                                //   activeColor: US_APP_COLOR,
                                //   direction: Axis.vertical,
                                //   groupValue: _verticalGroupValue[index],
                                //   horizontalAlignment:
                                //       MainAxisAlignment.spaceAround,
                                //   onChanged: (value) {
                                //     print('index: ' + index.toString());
                                //     String trl = '';
                                //     if (value == lst_Cauhoi[index].dapAn1) {
                                //       trl = "A";
                                //     }
                                //     if (value == lst_Cauhoi[index].dapAn2) {
                                //       trl = "B";
                                //     }
                                //     if (value == lst_Cauhoi[index].dapAn3) {
                                //       trl = "C";
                                //     }
                                //     if (value == lst_Cauhoi[index].dapAn4) {
                                //       trl = "D";
                                //     }
                                //     setState(() {
                                //       trl;
                                //     });
                                //     BaiKiemTraVM.traLoiMotCau(
                                //         trl,
                                //         lst_Cauhoi[index].id!,
                                //         widget.id,
                                //         baiDaluu!.baikiemtra![index].idTraLoi!);
                                //     setState(() {
                                //       _verticalGroupValue[index] = value!;
                                //     });
                                //   },
                                //   items: _status,
                                //   textStyle: TextStyle(
                                //       overflow: TextOverflow.clip,
                                //       fontSize: 20),
                                //   itemBuilder: (item) => RadioButtonBuilder(
                                //     item,
                                //   ),
                                // ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Đáp án: ${baiDaluu!.baikiemtra![index].dapAnDung}',
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      baiDaluu!.baikiemtra![index].dapAn != null
                                          ? baiDaluu!.baikiemtra![index]
                                                      .dapAn !=
                                                  'L'
                                              ? 'Sinh viên chọn: ${baiDaluu!.baikiemtra![index].dapAn}'
                                              : 'Sinh viên chưa làm bài'
                                          : 'Sinh viên chưa làm bài',
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    childCount: lst_Cauhoi.length,
                  )),
                  SliverList(delegate: SliverChildListDelegate([]))
                ],
              ));
        } else {
          return Loading();
        }
      },
    );
  }
}

class GroupRadioButton extends StatefulWidget {
  final Color color;
  final List<Widget> label;
  final EdgeInsets padding;
  final Function(int) onChanged;
  final double radioRadius;
  final double spaceBetween;
  late final int selectedIndex;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  GroupRadioButton({
    required this.label,
    required this.padding,
    required this.onChanged,
    this.color = Colors.blue,
    this.radioRadius = 14.0,
    this.spaceBetween = 5.0,
    required this.selectedIndex,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  _GroupRadioButtonState createState() => _GroupRadioButtonState();
}

class _GroupRadioButtonState extends State<GroupRadioButton> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.label != null ? widget.label.length : 0,
        itemBuilder: (context, index) {
          return LabeledRadio(
            selectedIndex: widget.selectedIndex,
            color: widget.color,
            onChanged: (value) {
              setState(() {
                widget.onChanged(value);
                // print(value);
              });
            },
            index: index,
            label: widget.label[index],
            crossAxisAlignment: widget.crossAxisAlignment,
            mainAxisAlignment: widget.mainAxisAlignment,
            radioRadius: widget.radioRadius,
            spaceBetween: widget.spaceBetween,
            padding: widget.padding,
          );
        });
  }
}

class LabeledRadio extends StatelessWidget {
  LabeledRadio({
    required this.label,
    required this.index,
    required this.color,
    //required this.groupValue,
    //required this.value,
    required this.onChanged,
    required this.radioRadius,
    required this.padding,
    required this.spaceBetween,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.selectedIndex,
  });

  final Color color;
  final int selectedIndex;
  final Widget label;
  final index;
  final EdgeInsets padding;
  //final bool groupValue;
  //final bool value;
  final Function(int) onChanged;
  final double radioRadius;
  final double spaceBetween;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(index);
      },
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                //color: Const.mainColor,
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 2),
              ),
              padding: EdgeInsets.all(2),
              child: selectedIndex == index
                  ? Container(
                      height: radioRadius,
                      width: radioRadius,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    )
                  : Container(
                      height: radioRadius,
                      width: radioRadius,
                    ),
            ),
            SizedBox(
              width: spaceBetween,
            ),
            label,
          ],
        ),
      ),
    );
  }
}
