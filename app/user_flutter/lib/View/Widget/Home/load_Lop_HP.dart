import 'package:flutter/material.dart';
import 'package:user_flutter/Model/home_data.dart';
import 'package:user_flutter/Model/lop_HP.dart';
import 'package:user_flutter/Model_View/get_lopHp.dart';
import 'package:user_flutter/View/Widget/Home/subject_item.dart';
import 'package:user_flutter/View/page/subject_view.dart';

class Load_lopHP extends StatefulWidget {
  const Load_lopHP({Key? key}) : super(key: key);

  @override
  State<Load_lopHP> createState() => _Load_lopHPState();
}

class _Load_lopHPState extends State<Load_lopHP> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<lop_HP>(
      future: LopHocPhan.getLopHP(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            // final LopHP = snapshot.data!.lophocphan![index];

            return Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: GestureDetector(
                onTap: () {
                  // Navigate to subject view
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SubjectView(subject: subjects[1]),
                    ),
                  );
                },
                child: SubjectItem(subject: snapshot.data!.lophocphan![index]),
              ),
            );
          }, childCount: snapshot.data!.lophocphan!.length));
        } else {
          return SliverList(
              delegate: SliverChildListDelegate([
            Container(
              color: Colors.red,
            )
          ]));
        }
      },
    );
  }
}
