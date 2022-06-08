import 'package:flutter/material.dart';
import 'package:user_flutter/Widget/Navi/navigation_drawer_widget.dart';


class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Notifications'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
      );
}
