import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/dimen.dart';
import 'package:flutter/material.dart';

import '../../data/Posts.dart';

class HomeList extends StatefulWidget {
  final ScrollController scrollController;
  final Posts lstpost;
  HomeList({Key? key, required this.lstpost, required this.scrollController})
      : super(key: key);

  @override
  _HomeListState createState() => _HomeListState(lstpost: lstpost);
}

class _HomeListState extends State<HomeList> {
  final Posts lstpost;
  _HomeListState({required this.lstpost});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: widget.scrollController,
      itemCount: lstpost.baiviet!.length,
      itemBuilder: (context, index) {
        if (lstpost.baiviet![index].trangThai != 0) {
          return Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lstpost.baiviet![index].loaibaiviet!.tenLoai
                                .toString(),
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                lstpost.baiviet![index].createdAt.toString(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            lstpost.baiviet![index].noiDung.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ))));
        }
        return Center(
          child: Text(''),
        );
      },
    );
  }
}
