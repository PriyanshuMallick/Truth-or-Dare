import 'package:flutter/material.dart';
import 'package:truthordare/widgets/stylish/gradient_stack.dart';

import '../../theme/app_consts.dart';

class MyCard extends StatelessWidget {
  final Widget? child;
  final List<Gradient> gradients;
  final Color? color;
  final double? cardHeight;
  final double? cardWidth;
  final List<BoxShadow>? boxShadow;
  const MyCard({
    super.key,
    required this.gradients,
    this.child,
    this.color,
    this.cardHeight,
    this.cardWidth,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight ?? AppConsts.cardHeight,
      width: cardWidth ?? AppConsts.cardWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: boxShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: GradientStack(
        gradients: gradients,
        child: color == null
            ? child
            : Container(
                color: color,
                child: child,
              ),
      ),
    );
  }
}
