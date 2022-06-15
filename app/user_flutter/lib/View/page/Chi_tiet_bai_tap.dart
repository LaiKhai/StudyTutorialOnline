import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/View/Widget/Bai_kiemtra/Tra_loi.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/dimen.dart';

import '../common/constant/string.dart';

class Chi_tiet_Page extends StatefulWidget {
  const Chi_tiet_Page({Key? key}) : super(key: key);

  @override
  _Chi_tiet_PageState createState() => _Chi_tiet_PageState();
}

class _Chi_tiet_PageState extends State<Chi_tiet_Page> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF57636C),
          ),
        ),
        title: Text(
          'Class Details',
          style: GoogleFonts.quicksand(
            color: const Color(0xFF57636C),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF1F4F8),
      body: CustomScrollView(
        key: centerKey,
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://www.w3schools.com/w3css/img_lights.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: 230,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://www.w3schools.com/w3css/img_forest.jpg',
                          ),
                          radius: 25,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Tên bài tập',
                          style: GoogleFonts.quicksand(
                            color: const Color(0xFF57636C),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bắt đầu: 10:00',
                        style: GoogleFonts.quicksand(
                          color: const Color(0xFF4B39EF),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Kết thúc: 11:00',
                        style: GoogleFonts.quicksand(
                          color: const Color(0xFF4B39EF),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'The best of all 3 worlds, Row & Flow offers high intensity rowing and strength intervals followed by athletic based yoga sure to enhance flexible and clear the mind. Yoga mats are provided but bringing your own yoga mat is highly encouraged.',
                          style: GoogleFonts.quicksand(
                            color: const Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                  height: 1.6,
                  color: AppColor.theme,
                  width: double.infinity,
                ),
                Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Tệp đính kèm',
                          style: GoogleFonts.quicksand(
                            color: const Color(0xFF57636C),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ])),
          SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                height: 90.0 * 8,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: 8,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 00,
                      mainAxisSpacing: 0,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: getWidthSize(context) / 3,
                              height: getWidthSize(context) / 3,
                              decoration: BoxDecoration(
                                color: AppColor.grey,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 2,
                                    color: Color(0xFF626262),
                                    spreadRadius: 1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  '.doc',
                                  style: GoogleFonts.quicksand(
                                      color: AppColor.grey2,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.feed_outlined),
                              Text(
                                'tên file',
                                style: GoogleFonts.quicksand(
                                  color: const Color(0xFF57636C),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    })),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
              height: 1.6,
              color: AppColor.theme,
              width: double.infinity,
            ),
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Trả lời',
                      style: GoogleFonts.quicksand(
                        color: const Color(0xFF57636C),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )),
            Tra_Loi()
          ]))
        ],
      ),
    );
  }
}
