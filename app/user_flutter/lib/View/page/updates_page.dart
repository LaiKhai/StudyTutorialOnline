import 'package:flutter/material.dart';
import 'package:user_flutter/View/Widget/Navi/navigation_drawer_widget.dart';

class UpdatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Updates'),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
      );
}
