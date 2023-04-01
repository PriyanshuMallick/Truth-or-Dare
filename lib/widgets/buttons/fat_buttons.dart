import 'package:flutter/material.dart';

import '../../theme/app_styles.dart';
import '../../utils/app_layout.dart';

class FatButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Function onTap;
  final double height;
  final double width;
  const FatButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.onTap,
    this.height = 51,
    this.width = 135,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: AppLayout.getHeight(height),
        width: AppLayout.getWidth(width),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyles.headLineStyle5,
          ),
        ),
      ),
    );
  }
}
