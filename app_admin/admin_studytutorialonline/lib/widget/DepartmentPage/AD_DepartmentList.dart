import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/dimen.dart';
import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:admin_studytutorialonline/data/Department.dart';
import 'package:flutter/material.dart';

class DepartmentList extends StatefulWidget {
  final List<Department> lstDepartment;
  const DepartmentList({Key? key, required this.lstDepartment})
      : super(key: key);

  @override
  State<DepartmentList> createState() =>
      _DepartmentListState(lstDepartment: lstDepartment);
}

class _DepartmentListState extends State<DepartmentList> {
  final List<Department> lstDepartment;
  _DepartmentListState({required this.lstDepartment});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: getHeightSize(context) * 0.6,
        child: ListView.builder(
            itemCount: lstDepartment.length,
            itemBuilder: (context, index) => Container(
                  height: getHeightSize(context) * 0.1,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      semanticContainer: true,
                      margin: EdgeInsets.all(6),
                      child: ListTile(
                        title: Container(
                          margin: EdgeInsets.all(5),
                          child: Text(lstDepartment[index].tenkhoa,
                              style: ggTextStyle(
                                  20, FontWeight.bold, AppColor.theme)),
                        ),
                      )),
                )));
  }
}
