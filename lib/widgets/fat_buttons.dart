import 'package:flutter/material.dart';
import 'package:truthordare/theme/app_styles.dart';
import 'package:truthordare/utils/app_layout.dart';

class FatButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Function onTap;
  const FatButton({super.key, required this.text, required this.bgColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 80,
        width: AppLayout.getWidthPercent(40),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyles.headLineStyle3,
          ),
        ),
      ),
    );
  }
}
