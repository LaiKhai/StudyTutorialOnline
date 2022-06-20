import 'package:flutter/material.dart';
import 'package:user_flutter/model/navigation_item.dart';




class NavigationProvider extends ChangeNotifier {
  NavigationItem _navigationItem = NavigationItem.people;

  NavigationItem get navigationItem => _navigationItem;

  void setNavigationItem(NavigationItem navigationItem) {
    _navigationItem = navigationItem;

    notifyListeners();
  }
}
