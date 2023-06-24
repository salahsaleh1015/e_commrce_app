import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const CustomText(
      {
        required this.title,
        required this.fontSize,
        required this.color,
        required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(

        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        //overflow: TextOverflow.ellipsis,
      ),
    );
  }
}