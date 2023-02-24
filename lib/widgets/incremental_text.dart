import 'dart:async';

import 'package:flutter/material.dart';
import '../theme/app_styles.dart';

class IncrementalText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final Duration duration;
  final Color cursorColor;
  final double cursorWidth;
  final double cursorHeight;

  const IncrementalText({
    super.key,
    required this.text,
    this.style = AppStyles.headLineStyle3,
    this.duration = const Duration(milliseconds: 50),
    this.textAlign = TextAlign.center,
    this.cursorColor = Colors.black,
    this.cursorWidth = 2.0,
    this.cursorHeight = 20.0,
  });

  Stream<String> get _textStream async* {
    for (var i = 1; i <= text.length; i++) {
      await Future.delayed(duration);
      yield text.substring(0, i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: _textStream,
      builder: (context, snapshot) {
        final displayedText = snapshot.data ?? '';
        return Text(
          displayedText,
          style: style,
          textAlign: textAlign,
        );
      },
    );
  }
}
