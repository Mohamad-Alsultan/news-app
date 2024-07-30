import 'package:flutter/material.dart';

SnackBar customSnackBar(
  BuildContext context, {
  required String title,
  required String message,
  required Color backgroundColor,
  bool closeButton = false,
  required EdgeInsetsGeometry? margin,
}) {
  return SnackBar(
      backgroundColor: backgroundColor,
      showCloseIcon: closeButton,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      margin: margin,
      behavior: SnackBarBehavior.floating,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            message,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ));
}
