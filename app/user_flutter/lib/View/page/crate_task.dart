import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/View/Widget/Bai_kiemtra/Tra_loi.dart';
import 'package:user_flutter/View/Widget/Bai_kiemtra/show_date.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/controller/tao_bai.dart';

class TaoPostWidget extends StatefulWidget {
  const TaoPostWidget({Key? key}) : super(key: key);

  @override
  _TaoPostWidgetState createState() => _TaoPostWidgetState();
}

class _TaoPostWidgetState extends State<TaoPostWidget> {
  DateTime time = DateTime.now();
  DateTime date = new DateTime.now();
  List<File> files = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Create Task',
          style: GoogleFonts.quicksand(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Container(
                height: 48,
                width: 48,
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.only(bottom: 20),
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 0),
                                child: TextFormField(
                                  controller: userNameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Tiêu đề',
                                    labelStyle: GoogleFonts.quicksand(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
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
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 32, 20, 12),
                                  ),
                                  style: GoogleFonts.quicksand(),
                                  textAlign: TextAlign.start,
                                  maxLines: null,
                                  maxLength: 150,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 0),
                                child: TextFormField(
                                  controller: shortBioController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText:
                                        'Hướng dẫn chi tiết (không bắt buộc)...',
                                    hintStyle: GoogleFonts.quicksand(),
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
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 32, 20, 12),
                                  ),
                                  style: GoogleFonts.quicksand(),
                                  textAlign: TextAlign.start,
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 0),
                                child: TextFormField(
                                  controller: userNameController,
                                  keyboardType: TextInputType.number,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Điểm tối đa',
                                    labelStyle: GoogleFonts.quicksand(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
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
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 32, 20, 12),
                                  ),
                                  style: GoogleFonts.quicksand(),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GuiFiles(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.24,
                              height: 40,
                              decoration: BoxDecoration(
                                color: US_APP_COLOR,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: US_APP_LINE,
                                  width: 1,
                                ),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    DatePicker.showTimePicker(context,
                                        showTitleActions: true,
                                        onChanged: (date) {
                                      if (date.microsecondsSinceEpoch >
                                          DateTime.now()
                                              .microsecondsSinceEpoch) {
                                        setState(() {
                                          time = date;
                                        });
                                      } else if (date.microsecondsSinceEpoch ==
                                          DateTime.now()) {
                                        if (time.microsecondsSinceEpoch <=
                                            DateTime.now()
                                                .microsecondsSinceEpoch) {
                                          setState(() {
                                            time = DateTime.now();
                                          });
                                        } else {
                                          setState(() {
                                            time = date;
                                          });
                                        }
                                      } else {
                                        time = DateTime.now();
                                      }
                                    }, currentTime: time);
                                  },
                                  child: Text(
                                    '${time.hour}:${time.minute}',
                                    style: GoogleFonts.quicksand(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            Text('Ngày'),
                            Date_time_but(
                              dateTime: date,
                              texts: 'End day',
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            elevation: 0,
                            highlightElevation: 0,
                            splashColor:
                                Theme.of(context).canvasColor.withOpacity(0.15),
                            highlightColor:
                                Theme.of(context).canvasColor.withOpacity(0.25),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            color: const Color(0xFF71b665),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Giao bài",
                              style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              // Do something & close modal
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
