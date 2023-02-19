import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color color;
  final Function onTap;

  const CircularButton({
    super.key,
    required this.icon,
    required this.bgColor,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        padding: const EdgeInsets.all(25),
        child: Icon(
          icon,
          color: color,
          size: 32,
        ),
      ),
    );
  }
}
