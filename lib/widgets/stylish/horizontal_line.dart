import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final BoxDecoration? decoration;

  const HorizontalLine({
    super.key,
    this.height = 1,
    this.width,
    this.color = Colors.white,
    this.decoration,
    this.margin = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      color: color,
      decoration: decoration,
    );
  }
}
