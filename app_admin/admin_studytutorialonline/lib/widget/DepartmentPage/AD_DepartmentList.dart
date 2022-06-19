import 'package:admin_studytutorialonline/common/contrains/color.dart';
import 'package:flutter/material.dart';

class KhoaList extends StatelessWidget {
  const KhoaList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            title: const Text(
              'Công nghệ thông tin',
              style: TextStyle(
                  color: AppColor.theme,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            subtitle: Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  Icons.person,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Nguyễn Viết ZDung',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ))
    ]);
  }
}
