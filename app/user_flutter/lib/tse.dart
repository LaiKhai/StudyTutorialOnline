import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class Dropdow extends StatefulWidget {
  const Dropdow({Key? key}) : super(key: key);

  @override
  State<Dropdow> createState() => _DropdowState();
}

class _DropdowState extends State<Dropdow> {
  String dropdownValue = 'A';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            'Đáp án đúng:',
            style: GoogleFonts.quicksand(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: US_APP_COLOR, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: DropdownButton<String>(
              value: dropdownValue,
              elevation: 16,
              style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['A', 'B', 'C', 'D']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
