import 'package:flutter/material.dart';
import 'package:user_flutter/View/page/NaviGa.dart';
import 'package:user_flutter/View/page/subject_view.dart';

class CustomWillPopBL extends StatelessWidget {
  final Widget child;
  int idlop;
   CustomWillPopBL({
    Key? key,
    required this.idlop,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> _onClose() async {
      return await Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => SubjectView(id_lopHp: idlop,)),
          (route) => false);
    }

    return WillPopScope(
      onWillPop: _onClose,
      child: child,
    );
  }
}
