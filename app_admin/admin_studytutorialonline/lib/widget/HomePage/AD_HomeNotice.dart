import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:flutter/material.dart';

class HomeNoti extends StatefulWidget {
  const HomeNoti({Key? key}) : super(key: key);

  @override
  _HomeNotiState createState() => _HomeNotiState();
}

class _HomeNotiState extends State<HomeNoti> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            'Thông báo',
            style: TextStyle(
                color: AppColor.black,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 60,
          child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(11)),
                  border: Border.all(color: Color.fromARGB(255, 90, 81, 81))),
              padding: const EdgeInsets.only(left: 5),
              width: double.infinity,
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  controller: _text,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Color(0xFFC56464),
                        //size: 25,
                      ),
                      hintText: 'Bạn muốn thông báo gì hôm nay...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      )),
                ),
              )),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            'Danh sách các thông báo',
            style: TextStyle(
                color: AppColor.black,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
