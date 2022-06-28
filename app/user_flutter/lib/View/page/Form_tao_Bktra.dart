import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import 'package:user_flutter/View/controller/tao_bai.dart';

class Tao_trac_nghiem extends StatefulWidget {
  const Tao_trac_nghiem({Key? key}) : super(key: key);

  @override
  State<Tao_trac_nghiem> createState() => _Tao_trac_nghiemState();
}

class _Tao_trac_nghiemState extends State<Tao_trac_nghiem> {
  String _verticalGroupValue = "Pending";
  List<String> _status = ["Pending", "Released", "Blocked"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          key: centerKey,
          slivers: <Widget>[
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
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
                      TextFormField(
                        controller: userNameController,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Tiêu đề',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF080808),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF080808),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: userNameController,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Mô tả chi tiết',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF080808),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF080808),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ])),
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: userNameController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Tiêu đề',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF080808),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF080808),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })),
            SliverToBoxAdapter(
              child: RadioGroup<String>.builder(
                direction: Axis.vertical,
                groupValue: _verticalGroupValue,
                horizontalAlignment: MainAxisAlignment.spaceAround,
                onChanged: (value) => setState(() {
                  _verticalGroupValue = value!;
                }),
                items: _status,
                textStyle: TextStyle(fontSize: 15, color: Colors.blue),
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
