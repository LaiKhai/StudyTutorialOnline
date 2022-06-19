import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_flutter/Model/User_login.dart';
import 'package:user_flutter/Model/home_data.dart';
import 'package:user_flutter/Model_View/get_lop.dart';
import 'package:user_flutter/Model_View/login.dart';
import 'package:user_flutter/View/Widget/Home/thong_bao.dart';
import 'package:user_flutter/View/Widget/Navi/navigation_drawer_widget.dart';
import 'package:user_flutter/View/common/constant/color.dart';
import '../Widget/Home/app_icon_buttton.dart';
import '../Widget/Home/assignment_week.dart';
import '../Widget/Home/subject_item.dart';
import 'subject_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isGiangvien = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Key centerKey = const ValueKey<String>('bottom-sliver-list');
    return FutureBuilder<User_login>(
        future: Login.getUs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.token);
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: AppColor.theme,
                  actions: [
                    AppIconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/schedule.svg",
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(width: 12),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: AppIconButton(
                        icon: Stack(
                          children: [
                            thong_bao(),
                            Positioned(
                              right: 2,
                              top: 0,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  border: Border.all(
                                    color: Color(0xFFdcdcdc),
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(360),
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/user.png"),
                    )
                  ],
                ),
                drawer: NavigationDrawerWidget(),
                backgroundColor: const Color(0xFFF6F9FE),
                floatingActionButton: isGiangvien
                    ? FloatingActionButton(
                        onPressed: () {
                          showBarModalBottomSheet(
                            context: context,
                            animationCurve: Curves.easeInOut,
                            backgroundColor: Theme.of(context).canvasColor,
                            bounce: true,
                            enableDrag: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            )),
                            builder: (ctx) => Padding(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tham gia lớp",
                                      style: GoogleFonts.quicksand(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    TextField(
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                      style: GoogleFonts.quicksand(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "Nhập mã lớp",
                                        hintStyle: GoogleFonts.quicksand(
                                          color: AppColor.grey.withOpacity(
                                            0.75,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Color(0xFFdcdcdc),
                                            width: 1.5,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 32),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(360),
                                              child: Image.asset(
                                                "assets/images/user.png",
                                                width: 32,
                                                height: 32,
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Lê Thanh Duy",
                                                  style: GoogleFonts.quicksand(
                                                    color: AppColor.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(height: 2),
                                                Text(
                                                  "ekowidiatmoko@gmail.com",
                                                  style: GoogleFonts.quicksand(
                                                    color: AppColor.grey,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        AppIconButton(
                                          icon: Icon(
                                            Icons.chevron_right,
                                            color:
                                                AppColor.grey.withOpacity(0.75),
                                          ),
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 32),
                                    MaterialButton(
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      elevation: 0,
                                      highlightElevation: 0,
                                      splashColor: Theme.of(context)
                                          .canvasColor
                                          .withOpacity(0.15),
                                      highlightColor: Theme.of(context)
                                          .canvasColor
                                          .withOpacity(0.25),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 32,
                                        vertical: 16,
                                      ),
                                      color: const Color(0xFF71b665),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "Tham Gia",
                                        style: GoogleFonts.quicksand(
                                          color: AppColor.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onPressed: () {
                                        // Do something & close modal
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        backgroundColor: const Color(0xFF71b665),
                        splashColor: AppColor.black.withOpacity(0.35),
                        child: const Icon(
                          Icons.add,
                        ),
                      )
                    : null,
                body: CustomScrollView(
                  key: centerKey,
                  slivers: <Widget>[
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: 32, left: 20, right: 20),
                        decoration: const BoxDecoration(
                          color: AppColor.theme,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.quicksand(
                                    fontSize: 24,
                                    color: AppColor.white,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Xin chào ",
                                      style: GoogleFonts.quicksand(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    TextSpan(
                                        text: snapshot.data!.user!.hoTen,
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  "Cảm ơn bạn đã chọn chúng tôi và chúng tôi sẽ cố gắng hết sức hổ trợ bạn.",
                                  style: GoogleFonts.quicksand(
                                    color: AppColor.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Tuần này",
                                  style: GoogleFonts.quicksand(
                                    color: AppColor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(360),
                                  splashColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.25),
                                  highlightColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.4),
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                      "Tất cả",
                                      style: GoogleFonts.quicksand(
                                        color: AppColor.primary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: const [
                                Expanded(
                                  child: AssignmentWeek(
                                    count: 5,
                                    subjects: ["Tên các lớp giao bài tập "],
                                    type: AssignmentType.assigned,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: AssignmentWeek(
                                    count: 2,
                                    subjects: ["các lớp bỏ lở bài tập"],
                                    type: AssignmentType.missed,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                    ])),
                    SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                      final subject = subjects[1];

                      return Container(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to subject view
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => SubjectView(subject: subject),
                              ),
                            );
                          },
                          child: SubjectItem(subject: subject),
                        ),
                      );
                    }, childCount: 10)),
                  ],
                ),
              ),
            );
          } else {
            return Container(
                child: Center(
              child: CircularProgressIndicator(strokeWidth: 10),
            ));
          }
        });
  }
}
