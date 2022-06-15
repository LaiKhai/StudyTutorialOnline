import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class Tra_Loi extends StatefulWidget {
  const Tra_Loi({Key? key}) : super(key: key);

  @override
  State<Tra_Loi> createState() => _Tra_LoiState();
}

class _Tra_LoiState extends State<Tra_Loi> {
  @override
  Widget build(BuildContext context) {
    return // Generated code for this checkout_BottomSheet Widget...
        Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 30),
      child: Container(
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
        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Text(
                'File đính kèm',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF14181B),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Divider(
              height: 24,
              thickness: 2,
              color: Color(0xFFF1F4F8),
            ),
            ListView(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFFF1F4F8),
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: Color(0xFF57636C),
                              child: Center(
                                  child: Text('.docss',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.grey2,
                                          fontSize: 13))),
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Item Name',
                                    style: TextStyle(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF14181B),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Text(
                                        'Secondary text',
                                        style: TextStyle(
                                          fontFamily: 'Roboto Mono',
                                          color: Color(0xFF57636C),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'X',
                              style: GoogleFonts.quicksand(
                                  color: Color(0xFF57636C),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
                    child: // Generated code for this Container Widget...
                        Material(
                      color: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: Center(
                            child: Text(
                          '+ Thêm file',
                          style: GoogleFonts.quicksand(
                              color: US_APP_COLOR,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: US_APP_COLOR,
                            width: 1,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
