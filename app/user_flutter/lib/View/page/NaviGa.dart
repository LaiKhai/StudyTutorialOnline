import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_flutter/View/Widget/test.dart';
import 'package:user_flutter/View/page/cai_dat_page.dart';
import 'package:user_flutter/View/page/favourites_page.dart';
import 'package:user_flutter/View/page/home_view.dart';
import 'package:user_flutter/View/page/thong_bao_page.dart';
import 'package:user_flutter/model/navigation_item.dart';
import 'package:user_flutter/provider/navigation_provider.dart';
import 'package:user_flutter/text.dart';
import 'profile_page.dart';
import 'updates_page.dart';

class Navigator_page extends StatelessWidget {
  static const String title = 'Navigation Drawer';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: MainPage(),
        ),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case NavigationItem.header:
        return Profile_page();
      case NavigationItem.people:
        return HomeView();
      case NavigationItem.favourites:
        return FavouritesPage();
      case NavigationItem.workflow:
        return const Thong_Bao_Page();
      case NavigationItem.updates:
        return app_tess();
      case NavigationItem.plugins:
        return const Cai_Dat_Page();
      case NavigationItem.notifications:
        return Cai_Dat_Page();
    }
  }
}
