import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.maxLine,
    this.color,
    this.fSize,
    this.fw, this.td,
  });

  final String text;
  final int? maxLine;
  final Color? color;
  final double? fSize;
  final FontWeight? fw;
  final TextDecoration? td;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine?? 1,
      style: TextStyle(
        color: color ?? Colors.grey,
        fontSize: fSize ?? 15,
        fontWeight: fw ?? FontWeight.normal,
        decoration: td ?? TextDecoration.none,
      ),
    );
  }
}
