import 'package:flutter/material.dart';

import '../utils/app_layout.dart';
import '../theme/app_styles.dart';

class FatButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Function onTap;
  const FatButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: AppLayout.getHeight(51),
        width: AppLayout.getWidth(135),
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
