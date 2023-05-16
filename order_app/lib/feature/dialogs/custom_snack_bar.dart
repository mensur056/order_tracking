import 'package:flutter/material.dart';

class AppSnackBar {
  void customSnackBar(BuildContext context, String title, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color,
      content: Center(
        child: Text(title),
      ),
    ));
  }
}
