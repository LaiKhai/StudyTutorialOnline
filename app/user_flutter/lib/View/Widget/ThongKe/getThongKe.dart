import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Model/ThongKeM.dart';
import 'package:user_flutter/Model_View/ThongKeMV.dart';
import 'package:user_flutter/View/Widget/widget_loadin.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class getThongKe extends StatefulWidget {
  int idbktra;
  getThongKe({Key? key, required this.idbktra}) : super(key: key);

  @override
  State<getThongKe> createState() => _getThongKeState();
}

class _getThongKeState extends State<getThongKe> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ThongKeM?>(
        future: ThongKeMV.getThongKe(widget.idbktra),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "${snapshot.data!.hoanthanh! + snapshot.data!.noptre!}",
                        style: GoogleFonts.quicksand(
                            fontSize: 40, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Đã nộp',
                        style: GoogleFonts.quicksand(
                            fontSize: 25, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  color: US_APP_LINE,
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        snapshot.data!.chuanop.toString(),
                        style: GoogleFonts.quicksand(
                            fontSize: 40, fontWeight: FontWeight.w700),
                      ),
                      Text('Đã giao',
                          style: GoogleFonts.quicksand(
                              fontSize: 25, fontWeight: FontWeight.normal)),
                    ],
                  ),
                )
              ],
            );
          } else {
            return Loading();
          }
        });
  }
}
