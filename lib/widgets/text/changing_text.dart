import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../theme/app_styles.dart';

class ChangingText extends StatelessWidget {
  final String Function() changingText;
  final String? text;
  final TextStyle style;
  final TextAlign textAlign;
  final Duration delay;
  final Duration duration;
  final bool isBlur;
  final double blurAmount;

  const ChangingText({
    super.key,
    this.text,
    required this.changingText,
    this.style = AppStyles.cardTitle,
    this.textAlign = TextAlign.center,
    this.delay = const Duration(milliseconds: 90),
    this.duration = const Duration(seconds: 4),
    this.isBlur = true,
    this.blurAmount = 4,
  });

  Stream<String> get _textStream async* {
    final endTime = DateTime.now().add(duration);
    while (DateTime.now().isBefore(endTime)) {
      await Future.delayed(delay);
      yield changingText();
    }
    yield text ?? changingText();
  }

  @override
  Widget build(BuildContext context) {
    final startTime = DateTime.now();
    final endTime = DateTime.now().add(duration);
    final elapsedTime = endTime.difference(startTime).inMilliseconds;
    return StreamBuilder<String>(
      stream: _textStream,
      builder: (context, snapshot) {
        final displayedText = snapshot.data ?? '';
        final int now = DateTime.now().difference(startTime).inMilliseconds;
        final double animationValue = (now < elapsedTime ? now : elapsedTime) / elapsedTime;
        final double easedValue = pow(animationValue, 3).toDouble();

        double blur = (easedValue - 1).abs() * blurAmount;

        if (!isBlur || blur <= 0) {
          return Text(
            displayedText,
            style: style,
            textAlign: textAlign,
          );
        }
        return ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: blur,
            sigmaY: blur,
          ),
          child: Text(
            displayedText,
            style: style,
            textAlign: textAlign,
          ),
        );
      },
    );
  }
}
