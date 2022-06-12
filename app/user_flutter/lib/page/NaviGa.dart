import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_flutter/page/cai_dat_page.dart';
import 'package:user_flutter/page/favourites_page.dart';
import 'package:user_flutter/page/header_page.dart';
import 'package:user_flutter/page/home_view.dart';
import 'package:user_flutter/page/notifications_page.dart';
import 'package:user_flutter/page/profile_page.dart';
import 'package:user_flutter/page/thong_bao_page.dart';
import 'package:user_flutter/provider/navigation_provider.dart';
import 'package:user_flutter/text.dart';

import '../data/model/navigation_item.dart';
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
        return const HomeView();
      case NavigationItem.favourites:
        return FavouritesPage();
      case NavigationItem.workflow:
        return const Thong_Bao_Page();
      case NavigationItem.updates:
        return UpdatesPage();
      case NavigationItem.plugins:
        return const Cai_Dat_Page();
      case NavigationItem.notifications:
        return Cai_Dat_Page();
    }
  }
}
