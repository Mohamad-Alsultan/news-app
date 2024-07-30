import 'package:flutter/material.dart';

class AppDimensions {
  // height screen => 812

  // height figma: 812,
  // height screen => 867.4285714285714
  // width screen => 411.42857142857144
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double width(context) => MediaQuery.of(context).size.width;
}

double getRes(context, double size) {
  double s = (AppDimensions.height(context) + AppDimensions.width(context)) *
      (size / (812 + 375));
  return s.floorToDouble();
}
