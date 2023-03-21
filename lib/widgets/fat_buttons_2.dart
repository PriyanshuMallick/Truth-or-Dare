import 'package:flutter/material.dart';
import 'package:truthordare/utils/app_layout.dart';

import '../theme/app_styles.dart';

class FatButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onTap;
  const FatButton({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppLayout.getWidth(135),
      height: AppLayout.getHeight(51),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: AppStyles.headLineStyle5,
        ),
      ),
    );
  }
}
