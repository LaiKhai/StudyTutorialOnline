import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/View/Widget/Bai_kiemtra/Tra_loi.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class Dang_thong_bao extends StatefulWidget {
  const Dang_thong_bao({Key? key}) : super(key: key);

  @override
  State<Dang_thong_bao> createState() => _Dang_thong_baoState();
}

class _Dang_thong_baoState extends State<Dang_thong_bao> {
  TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.white,
          backgroundColor: US_APP_WHITE,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: Colors.black,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: US_APP_COLOR),
                  onPressed: () {},
                  child: Text('Đăng',
                      style: GoogleFonts.quicksand(color: US_APP_WHITE))),
            )
          ],
        ),
        body: ListView(
          children: [
            // Generated code for this Row Widget...
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/bd297a54-27c5-43bf-889e-ee04ccf81e8b/therma-mens-full-zip-training-hoodie-DwfKtF.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Andres Franchellis',
                        style: GoogleFonts.quicksand(color: Colors.grey),
                      ),
                      Text(
                        '@andresfrans',
                        style: GoogleFonts.quicksand(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              color: US_APP_LINE,
            )
            // Generated code for this TextField Widget...
            ,
            TextFormField(
              controller: textController,
              maxLines: null,
              obscureText: false,
              decoration: const InputDecoration(
                hintText: 'nội dung chính',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                prefixIcon: Icon(
                  Icons.ten_mp,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              color: US_APP_LINE,
            ),
            Tra_Loi(),
          ],
        ),
      ),
    );
  }
}
