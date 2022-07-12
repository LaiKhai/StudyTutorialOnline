import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:admin_studytutorialonline/common/contrains/dimen.dart';
import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:admin_studytutorialonline/data/Department.dart';
import 'package:admin_studytutorialonline/page/AD_DepartmentSetting.dart';
import 'package:admin_studytutorialonline/provider/Department/DepartmentProvider.dart';
import 'package:flutter/material.dart';

import '../../data/User.dart';

class DepartmentList extends StatefulWidget {
  final User us;
  final List<Department> lstDepartment;
  const DepartmentList(
      {Key? key, required this.lstDepartment, required this.us})
      : super(key: key);

  @override
  State<DepartmentList> createState() =>
      _DepartmentListState(lstDepartment: lstDepartment, us: us);
}

class _DepartmentListState extends State<DepartmentList> {
  final User us;
  final List<Department> lstDepartment;
  _DepartmentListState({required this.lstDepartment, required this.us});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: getHeightSize(context) * 0.6,
        child: ListView.builder(
            itemCount: lstDepartment.length,
            itemBuilder: (context, index) {
              if (lstDepartment[index].trangthai != "0") {
                return Container(
                  height: getHeightSize(context) * 0.1,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      semanticContainer: true,
                      margin: EdgeInsets.all(6),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DepartmentSetting(
                                        departmentId: lstDepartment[index].id,
                                        us: us,
                                      )));
                        },
                        trailing: Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: getHeightSize(context) * 0.1,
                          child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              size: 25,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Text(
                                          'Bạn có chắc muốn xóa ${lstDepartment[index].tenkhoa}',
                                          style: ggTextStyle(13,
                                              FontWeight.bold, AppColor.black)),
                                      title: Row(
                                        children: [
                                          Icon(
                                            Icons.warning_rounded,
                                            color: AppColor.theme,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Thông báo',
                                              style: ggTextStyle(
                                                  13,
                                                  FontWeight.bold,
                                                  AppColor.black))
                                        ],
                                      ),
                                      actions: [
                                        Container(
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Không',
                                                  style: ggTextStyle(
                                                      13,
                                                      FontWeight.bold,
                                                      AppColor.black))),
                                        ),
                                        Container(
                                          child: TextButton(
                                              onPressed: () {
                                                DepartmentProvider
                                                    .deletedepartment(
                                                        context,
                                                        lstDepartment[index]
                                                            .tenkhoa,
                                                        us,
                                                        lstDepartment[index]
                                                            .id);
                                              },
                                              child: Text('Có',
                                                  style: ggTextStyle(
                                                      13,
                                                      FontWeight.bold,
                                                      AppColor.black))),
                                        )
                                      ],
                                    );
                                  });
                            },
                          ),
                        ),
                        title: Container(
                          margin: EdgeInsets.all(5),
                          child: Text(lstDepartment[index].tenkhoa,
                              style: ggTextStyle(
                                  20, FontWeight.bold, AppColor.theme)),
                        ),
                      )),
                );
              }
              return Center(
                child: Text(''),
              );
            }));
  }
}
