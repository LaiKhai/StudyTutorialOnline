import 'package:flutter/material.dart';
import 'package:user_flutter/View/Widget/Navi/navigation_drawer_widget.dart';


class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Favourites'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
      );
}
