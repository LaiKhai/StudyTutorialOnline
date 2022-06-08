//size screen
import 'package:flutter/material.dart';

double getWidthSize(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width;
}

double getHeightSize(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  return height;
}
