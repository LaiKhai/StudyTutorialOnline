import 'package:flutter/material.dart';
import 'package:user_flutter/Widget/Navi/navigation_drawer_widget.dart';
import 'package:user_flutter/data/user.dart';


class HeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text(name),
          centerTitle: true,
        ),
        body: Image.network(
          urlImage,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      );
}
