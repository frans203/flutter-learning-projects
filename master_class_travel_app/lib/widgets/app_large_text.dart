import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final Color color;
  final String text;
  AppLargeText({this.size = 30, this.color = Colors.black, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
