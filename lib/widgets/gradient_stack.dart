import 'package:flutter/material.dart';

class GradientStack extends StatelessWidget {
  final List<Gradient> gradients;
  final Widget child;
  GradientStack({super.key, required this.gradients, required this.child});
  int index = -1;
  @override
  Widget build(BuildContext context) {
    return gradients.isNotEmpty ? getGradients() : child;
  }

  Widget getGradients() {
    index++;
    return Container(
      decoration: BoxDecoration(gradient: gradients[index]),
      child: gradients.length - index > 1 ? getGradients() : child,
    );
  }
}
