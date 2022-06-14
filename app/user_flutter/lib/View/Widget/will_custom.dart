import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_flutter/View/page/NaviGa.dart';

class CustomWillPopChat extends StatelessWidget {
  final Widget child;
  const CustomWillPopChat({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> _onClose() async {
      return await Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Navigator_page()),
          (route) => false);
    }

    return WillPopScope(
      onWillPop: _onClose,
      child: child,
    );
  }
}
