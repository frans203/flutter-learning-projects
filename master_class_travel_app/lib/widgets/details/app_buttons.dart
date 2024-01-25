import 'package:flutter/material.dart';
import 'package:master_class_travel_app/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  bool? isIcon;
  double size;
  String? text;
  IconData? icon;
  final Color borderColor;
  AppButtons(
      {this.isIcon = false,
      this.text = "",
      this.icon,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Center(
          child: isIcon == false
              ? AppText(text: text!, color: color)
              : Icon(icon, color: color)),
    );
  }
}
