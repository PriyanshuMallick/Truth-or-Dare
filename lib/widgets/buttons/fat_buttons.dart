import 'package:flutter/material.dart';

import 'package:truthordare/theme/app_styles.dart';

class FatButton extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final Function onTap;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final Gradient? gradient;
  const FatButton({
    super.key,
    required this.text,
    this.bgColor,
    required this.onTap,
    this.height = 51,
    this.width = 135,
    this.gradient,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          color: bgColor,
          gradient: gradient,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyles.buttonText,
          ),
        ),
      ),
    );
  }
}
