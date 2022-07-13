import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/Model/User_login.dart';
import 'package:user_flutter/Model_View/Baiviet.dart';
import 'package:user_flutter/View/Widget/Bai_kiemtra/Tra_loi.dart';
import 'package:user_flutter/View/Widget/showNouti.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/common/constant/dimen.dart';
import 'package:user_flutter/View/controller/tao_bai.dart';

class Dang_thong_bao extends StatefulWidget {
  int id_lop;

  Dang_thong_bao({Key? key, required this.id_lop}) : super(key: key);

  @override
  State<Dang_thong_bao> createState() => _Dang_thong_baoState();
}

class _Dang_thong_baoState extends State<Dang_thong_bao> {
  bool switchListTileValue = false;
  TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: US_APP_WHITE,
        leading: IconButton(
            onPressed: () {
              setState(() {
                listFile.clear();
              });
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
            )),
        actions: [
          InkWell(
            onTap: () {
              int loai = 1;
              if (switchListTileValue == true) {
                loai = 2;
              } else {
                loai = 1;
              }
              print(loai);
              BaiViet.postBaiViet(
                  widget.id_lop, textController.text, context, loai);
            },
            child: Container(
                margin: EdgeInsets.all(8.0),
                width: getWidthSize(context) * 1 / 7,
                decoration: BoxDecoration(
                  color: US_APP_COLOR,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x34090F13),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text('Đăng',
                      style: GoogleFonts.quicksand(
                          color: Colors.white, fontWeight: FontWeight.w800)),
                )),
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
                      user.user!.avt!,
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
                      user.user!.hoTen!,
                      style: GoogleFonts.quicksand(
                          color: Colors.grey, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      user.user!.email!,
                      style: GoogleFonts.quicksand(
                          color: Colors.grey, fontWeight: FontWeight.w700),
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
            decoration: InputDecoration(
                hintStyle: GoogleFonts.quicksand(fontSize: 20),
                hintText: 'nội dung chính',
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                prefixIcon: SvgPicture.asset(
                  'assets/icons/edit.svg',
                  fit: BoxFit.none,
                  color: US_APP_COLOR_2,
                ),
                filled: true),
            style: GoogleFonts.quicksand(
                fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Container(
            width: double.infinity,
            height: 0.5,
            color: US_APP_LINE,
          ),

          if (user.user!.idKhoa != 0) ...[
            SwitchListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: US_APP_COLOR,
              activeTrackColor: US_APP_COLOR_2,
              value: switchListTileValue,
              title: Text(
                'Dạng câu hỏi',
                style: GoogleFonts.quicksand(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
              onChanged: (newValue) =>
                  setState(() => switchListTileValue = newValue),
            ),
          ],

          const Tra_Loi(),
        ],
      ),
    );
  }
}
