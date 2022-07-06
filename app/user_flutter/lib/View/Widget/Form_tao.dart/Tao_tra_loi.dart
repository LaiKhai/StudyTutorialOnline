import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class Tao_Trloi_TN extends StatefulWidget {
  TextEditingController controller = new TextEditingController();
  String name;
  Tao_Trloi_TN({Key? key, required this.controller, required this.name})
      : super(key: key);

  @override
  State<Tao_Trloi_TN> createState() => _Tao_Trloi_TNState();
}

class _Tao_Trloi_TNState extends State<Tao_Trloi_TN> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
            child: TextFormField(
              controller: widget.controller,
              obscureText: false,
              decoration: InputDecoration(
                labelText: widget.name,
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
                contentPadding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
              ),
              style: GoogleFonts.quicksand(),
              textAlign: TextAlign.start,
              maxLines: null,
            ),
          ),
        ],
      ),
    );
  }
}
