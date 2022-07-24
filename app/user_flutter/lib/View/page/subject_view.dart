import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_flutter/Model/BaiKiemTraSVModel.dart';
import 'package:user_flutter/Model/BaiKtrta.dart';
import 'package:user_flutter/Model/User_login.dart';
import 'package:user_flutter/Model/bai_Viet.dart';
import 'package:user_flutter/Model/cTiet_LopHP.dart';
import 'package:user_flutter/Model/class_data.dart';
import 'package:user_flutter/Model/home_data.dart';
import 'package:user_flutter/Model/listBaiKtra_model.dart';
import 'package:user_flutter/Model/model_reing/BaiTapModel.dart';
import 'package:user_flutter/Model/subject_assignment.dart';
import 'package:user_flutter/Model/subject_stream.dart';
import 'package:user_flutter/Model_View/Baiviet.dart';
import 'package:user_flutter/Model_View/bai_Ktra.dart';
import 'package:user_flutter/View/Widget/Bai_kiemtra/showdialog.dart';
import 'package:user_flutter/View/Widget/Chi_tiet/Popup.dart';
import 'package:user_flutter/View/Widget/Home/app_icon_buttton.dart';
import 'package:user_flutter/View/Widget/Home/assignment_item.dart';
import 'package:user_flutter/View/Widget/Home/stream_item.dart';
import 'package:user_flutter/View/Widget/Home/student_item.dart';
import 'package:user_flutter/View/Widget/Home/subject_post.dart';
import 'package:user_flutter/View/Widget/No_child.dart';
import 'package:user_flutter/View/Widget/button_back.dart';
import 'package:user_flutter/View/Widget/widget_loadin.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import 'package:user_flutter/View/page/NaviGa.dart';

import '../../Model_View/get_lopHp.dart';

class SubjectView extends StatefulWidget {
  int id_lopHp;
  SubjectView({Key? key, required this.id_lopHp}) : super(key: key);

  @override
  State<SubjectView> createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {
  int _activeIndex = 0;
  bool isGiangvien = false;
  isGiangVien() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    setState(() {
      isGiangvien = (sharedPref.getBool('isGiangVien') ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scroll = ScrollController();
    final pageController = PageController();
    Ctiet_lopHP chitiet = new Ctiet_lopHP();
    getclass() async {
      final lop = await LopHocPhan.getOneLopHP(widget.id_lopHp);
      setState(() {
        chitiet = lop;
      });
    }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      getclass();
    }

    List<SubjectStream> subjectStreams =
        streams.where((item) => item.subjectId == subjects[1].id).toList();
    final List<Map<String, dynamic>> menus = [
      {'index': 1, 'icon': Icons.timer, 'title': "Bảng tin"},
      {'index': 2, 'icon': Icons.assignment, 'title': "Bài tập"},
      {'index': 3, 'icon': Icons.group, 'title': "Mọi người"},
    ];
    final List<Widget> bodies = [
      StreamBody(
        streams: subjectStreams,
        id_Lop: widget.id_lopHp,
      ),
      AssignmentBody(
          id_lop: widget.id_lopHp,
          assignments: assignments
              .where((item) => item.subjectId == subjects[1].id)
              .toList()),
      ClassmateBody(id_lop: widget.id_lopHp)
    ];
    return CustomWillPopChat(
      child: SafeArea(
        child: FutureBuilder<Ctiet_lopHP>(
            future: LopHocPhan.getOneLopHP(widget.id_lopHp),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                chitiet = snapshot.data!;
                return Scaffold(
                  floatingActionButton: user.user!.idChucVu != 0
                      ? FloatingActionButton.extended(
                          backgroundColor: AppColor.theme,
                          label: Text(
                            '+',
                            style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            showBottomDialog(
                                context, snapshot.data!.lophocphan!);
                          },
                          tooltip: 'Increment',
                          //foregroundColor: Colors.yellow,
                          //backgroundColor: Colors.red,
                          //elevation: 0.0,
                          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        )
                      : null,
                  backgroundColor: const Color(0xFFF6F9FE),
                  body: Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: SingleChildScrollView(
                      controller: scroll,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              AppIconButton(
                                icon: SvgPicture.asset(
                                  "assets/icons/back.svg",
                                  width: 24,
                                  height: 24,
                                  color: AppColor.white,
                                ),
                                onTap: () {
                                  // Navigate back
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Navigator_page()),
                                      (route) => false);
                                },
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      chitiet.lophocphan!.bomon!.tenMonHoc!,
                                      style: GoogleFonts.quicksand(
                                        color: AppColor.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      chitiet.lophocphan!.lop!.tenLop!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.quicksand(
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AppIconButton(
                                    icon: SvgPicture.asset(
                                      "assets/icons/gmeet.svg",
                                      width: 24,
                                      height: 24,
                                      color: AppColor.white,
                                    ),
                                    onTap: () {},
                                  ),
                                  const SizedBox(width: 8),
                                  Popupmenu()
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          // Assignment highlight
                          // Row(
                          //   children: assignments
                          //       .where((item) => item.subjectId == widget.subject.id)
                          //       .take(2)
                          //       .map(
                          //         (item) => Expanded(
                          //           child: AssignmentHighlight(
                          //             assignment: item,
                          //             onTap: (item) {},
                          //           ),
                          //         ),
                          //       )
                          //       .toList(),
                          // ),
                          // const SizedBox(height: 32),
                          // Menu
                          GNav(
                            selectedIndex: _activeIndex,
                            curve: Curves.easeInOutQuint,
                            duration: const Duration(milliseconds: 300),
                            haptic: true,
                            gap: 8,
                            tabMargin:
                                const EdgeInsets.symmetric(horizontal: 8),
                            color: AppColor.grey,
                            activeColor: US_APP_COLOR,
                            tabBackgroundColor: US_APP_COLOR.withOpacity(0.25),
                            onTabChange: (index) {
                              setState(() {
                                _activeIndex = index;

                                pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOutQuint,
                                );
                              });
                            },
                            tabs: menus
                                .map(
                                  (menu) => GButton(
                                    gap: 8,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    icon: menu['icon'],
                                    text: menu['title'],
                                    textStyle: GoogleFonts.quicksand(
                                      color: US_APP_COLOR,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 16),
                          // Post
                          SizedBox(
                            height: MediaQuery.of(context).size.height - 150,
                            child: PageView.builder(
                              controller: pageController,
                              physics: const BouncingScrollPhysics(),
                              onPageChanged: (index) {
                                setState(() {
                                  _activeIndex = index;
                                });
                              },
                              itemCount: bodies.length,
                              itemBuilder: (ctx, index) => bodies[index],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Loading();
              }
            }),
      ),
    );
  }
}

class StreamBody extends StatefulWidget {
  int id_Lop;
  final List<SubjectStream> streams;

  StreamBody({Key? key, required this.streams, required this.id_Lop})
      : super(key: key);

  @override
  State<StreamBody> createState() => _StreamBodyState();
}

class _StreamBodyState extends State<StreamBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubjectPost(
          id_lop: widget.id_Lop,
        ),
        const SizedBox(height: 16),
        Expanded(
            child: FutureBuilder<baiViets>(
          future: BaiVietVM.getAllBaiViet(widget.id_Lop),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.data!.length == 0) {
                return NoChild(icon: 'comment.svg');
              } else {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (ctx, index) {
                    // Stream item
                    return StreamItem(
                      bv: snapshot.data!.data![index],
                    );
                  },
                );
              }
            } else {
              return Loading();
            }
          }),
        )),
      ],
    );
  }
}

class AssignmentBody extends StatefulWidget {
  final List<SubjectAssignment> assignments;
  final int id_lop;
  const AssignmentBody(
      {Key? key, required this.assignments, required this.id_lop})
      : super(key: key);

  @override
  State<AssignmentBody> createState() => _AssignmentBodyState();
}

class _AssignmentBodyState extends State<AssignmentBody> {
  @override
  Widget build(BuildContext context) {
    int id = 0;
    return Column(
      children: [
        SubjectPost(
          id_lop: id,
        ),
        const SizedBox(height: 16),
        Expanded(
            child: user.user!.idChucVu != 0
                ? FutureBuilder<List_Ktra_model>(
                    future: BaiKiemTraVM.Get_BKTra(widget.id_lop),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.data!.length == 0) {
                          return NoChild(icon: 'list-check.svg');
                        } else {
                          List_Ktra_model ktra = snapshot.data!;
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: ktra.data!.length,
                            itemBuilder: (ctx, index) {
                              final assignment = assignments[0];
                              BaiTapModel baitap = BaiTapModel(
                                  diem: 0.0,
                                  idLopHP: ktra.data![index].idLopHocPhan!,
                                  id: ktra.data![index].id!,
                                  tieuDe: ktra.data![index].tieuDe!,
                                  noiDung: ktra.data![index].noiDung!,
                                  createAt: ktra.data![index].createdAt!,
                                  type: ktra.data![index].trangThai!);
                              return AssignmentItem(
                                baikiemtra: baitap,
                              );
                            },
                          );
                        }
                      } else {
                        return Loading();
                      }
                    },
                  )
                : FutureBuilder<BaiKtraSVModel?>(
                    future: BaiKiemTraVM.Get_BKTraSV(widget.id_lop),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.data!.length == 0) {
                          return NoChild(icon: 'list-check.svg');
                        } else {
                          BaiKtraSVModel ktra = snapshot.data!;
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: ktra.data!.length,
                            itemBuilder: (ctx, index) {
                              BaiTapModel baiTap = BaiTapModel(
                                  diem: ktra.data![index].tongDiem!,
                                  idLopHP: ktra.data![index].idlophocphan!,
                                  id: ktra.data![index].idBaiKiemTra!,
                                  tieuDe: ktra.data![index].tieuDe!,
                                  noiDung: ktra.data![index].noiDung!,
                                  createAt: ktra.data![index].createdAt!,
                                  type: ktra.data![index].trangThai!);

                              final assignment = assignments[0];
                              return AssignmentItem(
                                baikiemtra: baiTap,
                              );
                            },
                          );
                        }
                      } else {
                        return Loading();
                      }
                    },
                  )),
      ],
    );
  }
}

class ClassmateBody extends StatelessWidget {
  int id_lop;
  ClassmateBody({Key? key, required this.id_lop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Ctiet_lopHP>(
      future: LopHocPhan.getOneLopHP(id_lop),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.dssv!.length == 0) {
            return NoChild(icon: 'groupuser.svg');
          }
          List<Dssv> dssv = snapshot.data!.dssv!;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: dssv.length,
                  itemBuilder: (ctx, index) {
                    final student = dssv[index];

                    return StudentItem(student: student, idlop_hp: id_lop);
                  },
                ),
              ),
            ],
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
