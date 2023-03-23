import 'package:flutter/material.dart';

import '../../theme/app_consts.dart';

class MyCard extends StatelessWidget {
  final Widget? child;
  final Gradient gradient;
  final Color? color;
  const MyCard({super.key, required this.gradient, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConsts.cardHeight,
      width: AppConsts.cardWidth,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(14),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        color: color,
        child: child,
      ),
    );
  }
}
