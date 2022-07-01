import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class Bai_Ktra extends StatefulWidget {
  String moTa;
  String tieuDe;
  List<TextEditingController> Lst_Cauhoi;
  List<List<TextEditingController>> lst_Trl_TracNghiem;
  Bai_Ktra(
      {Key? key,required this.tieuDe,
      required this.Lst_Cauhoi,
      required this.lst_Trl_TracNghiem,
      required this.moTa})
      : super(key: key);

  @override
  State<Bai_Ktra> createState() => _Bai_KtraState();
}

class _Bai_KtraState extends State<Bai_Ktra> {
  List<String> a = [];
  List<String> _verticalGroupValue = [];
  List<String> _status = ["Pendings", "Released", "Blocked"];
  khoitao_Value() {
    for (int i = 0; i < widget.Lst_Cauhoi.length; i++) {
      _verticalGroupValue.add('');
    }
    setState(() {
      _verticalGroupValue;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    khoitao_Value();
  }

  @override
  Widget build(BuildContext context) {
    print('cau hoi: ' + widget.Lst_Cauhoi.length.toString());
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: AppColor.theme,
              label: Text(
                'Nộp bài',
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
              tooltip: 'Increment',
              //foregroundColor: Colors.yellow,
              //backgroundColor: Colors.red,
              //elevation: 0.0,
              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            appBar: AppBar(
              backgroundColor: US_APP_COLOR,
              title: Text(
                widget.tieuDe,
                style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
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
                            widget.moTa,
                            style: GoogleFonts.quicksand(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )
                        ]),
                  )
                ])),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    List<String> a = [
                      widget.lst_Trl_TracNghiem[index][0].text,
                      widget.lst_Trl_TracNghiem[index][1].text,
                      widget.lst_Trl_TracNghiem[index][2].text,
                      widget.lst_Trl_TracNghiem[index][3].text
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
                          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                          padding:
                              EdgeInsets.only(bottom: 20, left: 20, right: 20),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Câu ${index + 1}: ' +
                                    widget.Lst_Cauhoi[index].text,
                                style: GoogleFonts.quicksand(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              RadioGroup<String>.builder(
                                activeColor: US_APP_COLOR,
                                direction: Axis.vertical,
                                groupValue: _verticalGroupValue[index],
                                horizontalAlignment:
                                    MainAxisAlignment.spaceAround,
                                onChanged: (value) => setState(() {
                                  _verticalGroupValue[index] = value!;
                                }),
                                items: _status,
                                textStyle: GoogleFonts.quicksand(
                                    fontSize: 15,
                                    color: US_APP_COLOR,
                                    fontWeight: FontWeight.w500),
                                itemBuilder: (item) => RadioButtonBuilder(
                                  item,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  childCount: widget.Lst_Cauhoi.length,
                )),
              ],
            )));
  }
}
