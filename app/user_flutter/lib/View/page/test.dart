import 'package:flutter/material.dart';
import 'package:user_flutter/View/controller/tracNghiemController.dart';

class Test extends StatefulWidget {
  List<TextEditingController> Lst_Cauhoi;
  List<List<TextEditingController>> lst_Trl_TracNghiem;
  Test({Key? key, required this.Lst_Cauhoi, required this.lst_Trl_TracNghiem})
      : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    print('cau hoi: ' + widget.Lst_Cauhoi.length.toString());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(
                'Câu hỏi: ' + widget.Lst_Cauhoi[index].text,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'A: ' + widget.lst_Trl_TracNghiem[index][0].text,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'B: ' + widget.lst_Trl_TracNghiem[index][1].text,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'C: ' + widget.lst_Trl_TracNghiem[index][2].text,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'D: ' + widget.lst_Trl_TracNghiem[index][3].text,
                style: TextStyle(color: Colors.black),
              ),
            ],
          );
        },
        itemCount: widget.Lst_Cauhoi.length,
      ),
    ));
  }
}
