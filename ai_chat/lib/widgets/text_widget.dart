import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.label,
      this.fontSize = 18,
      this.color,
      this.fontWeight});

  final String label;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(label,
        textAlign: TextAlign.justify,
        style: TextStyle(
            color: color ?? Colors.white,
            fontSize: fontSize,
            fontWeight: fontWeight ?? FontWeight.w400));
  }
}
