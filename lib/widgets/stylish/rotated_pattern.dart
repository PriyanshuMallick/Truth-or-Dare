import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/app_layout.dart';

class RotatedPattern extends StatelessWidget {
  final int column;
  final int row;
  final double gap;
  final double degree;
  final double scale;
  final Widget widget;

  const RotatedPattern({
    super.key,
    required this.column,
    required this.row,
    required this.gap,
    required this.degree,
    required this.scale,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Transform.rotate(
        angle: degree * pi / 180,
        child: Transform.scale(
          scale: scale,
          child: buildPattern(widget),
        ),
      ),
    );
  }

  Widget buildPattern(Widget widget) {
    List<Widget> rows = [];
    List<Widget> cols = [];
    int x = 0;
    for (int i = 0; i < column; i++) {
      rows.clear();
      x = row + (i % 2);
      for (int j = 0; j < x; j++) {
        rows.add(widget);
        if (j != x - 1) {
          rows.add(Gap(AppLayout.getWidth(gap)));
        }
      }
      cols.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows.toList(),
      ));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: cols,
    );
  }
}
