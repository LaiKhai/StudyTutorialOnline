import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  HomeList({Key? key}) : super(key: key);

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '[THÔNG BÁO] LỊCH THI BÁN KẾT CUỘC THI OLYMPIC TIN HỌC CAO THẮNG LẦN 6 - 2022',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.access_time,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '2022-06-10 12:00:34',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'BTC Cuộc thi Olympic Tin học Cao Thắng xin chúc mừng các đội đã xuất sắc vượt qua vòng loại tiến dến vòng...',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ))));
  }
}
