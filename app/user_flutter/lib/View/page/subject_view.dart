import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:user_flutter/Model/class_data.dart';
import 'package:user_flutter/Model/subject.dart';
import 'package:user_flutter/Model/subject_assignment.dart';
import 'package:user_flutter/Model/subject_stream.dart';
import 'package:user_flutter/View/Widget/Bai_kiemtra/showdialog.dart';
import 'package:user_flutter/View/Widget/Home/app_icon_buttton.dart';
import 'package:user_flutter/View/Widget/Home/assignment_item.dart';
import 'package:user_flutter/View/Widget/Home/stream_item.dart';
import 'package:user_flutter/View/Widget/Home/student_item.dart';
import 'package:user_flutter/View/Widget/Home/subject_post.dart';
import 'package:user_flutter/View/common/constant/color.dart';

class SubjectView extends StatefulWidget {
  final Subject subject;

  const SubjectView({Key? key, required this.subject}) : super(key: key);

  @override
  State<SubjectView> createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScrollController scroll = ScrollController();
    final pageController = PageController();
    List<SubjectStream> subjectStreams =
        streams.where((item) => item.subjectId == widget.subject.id).toList();
    final List<Map<String, dynamic>> menus = [
      {'index': 1, 'icon': Icons.timer, 'title': "Bản tin"},
      {'index': 2, 'icon': Icons.assignment, 'title': "Bài tập"},
      {'index': 3, 'icon': Icons.group, 'title': "Mọi người"},
    ];
    final List<Widget> bodies = [
      StreamBody(streams: subjectStreams),
      AssignmentBody(
          assignments: assignments
              .where((item) => item.subjectId == widget.subject.id)
              .toList()),
      const ClassmateBody()
    ];

    return SafeArea(
      child: Scaffold(
        floatingActionButton: _activeIndex == 1
            ? FloatingActionButton.extended(
                backgroundColor: AppColor.theme,
                label: Text(
                  'Tạo bài tập',
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  showBottomDialog(context);
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
          padding: const EdgeInsets.all(16),
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
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.subject.name,
                            style: GoogleFonts.quicksand( 
                              color: AppColor.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.subject.desc,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.quicksand(
                              color: AppColor.grey,
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
                        AppIconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/info.svg",
                            width: 24,
                            height: 24,
                            color: AppColor.white,
                          ),
                          onTap: () {},
                        ),
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
                  tabMargin: const EdgeInsets.symmetric(horizontal: 8),
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
      ),
    );
  }
}

class StreamBody extends StatelessWidget {
  final List<SubjectStream> streams;

  const StreamBody({Key? key, required this.streams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubjectPost(),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: streams.length,
            itemBuilder: (ctx, index) {
              final stream = streams[index];
              // Stream item
              return StreamItem(stream: stream);
            },
          ),
        ),
      ],
    );
  }
}

class AssignmentBody extends StatelessWidget {
  final List<SubjectAssignment> assignments;

  const AssignmentBody({Key? key, required this.assignments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubjectPost(),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: assignments.length,
            itemBuilder: (ctx, index) {
              final assignment = assignments[index];

              return AssignmentItem(
                assignment: assignment,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ClassmateBody extends StatelessWidget {
  const ClassmateBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: students.length,
            itemBuilder: (ctx, index) {
              final student = students[index];

              return StudentItem(student: student);
            },
          ),
        ),
      ],
    );
  }
}
