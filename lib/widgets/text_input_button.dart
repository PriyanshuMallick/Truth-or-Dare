
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:truthordare/theme/app_consts.dart';
import 'package:truthordare/theme/app_gradients.dart';
import 'package:truthordare/widgets/cards/text_input_card.dart';

import 'buttons/fat_buttons.dart';

class TextInputButton extends TextInputCard {
  final String text;
  final double? width;
  final double? height;
  final Color? color;
  final Gradient? gradient;
  final EdgeInsets? padding;
  const TextInputButton({
    super.key,
    required this.text,
    this.width = AppConsts.inputButtonWidth,
    this.height,
    this.color,
    this.gradient = AppGradients.inputFeild,
    this.padding = const EdgeInsets.symmetric(vertical: 9),
    required super.title,
    required super.onDone,
    super.isAlphaNumeric,
    super.titleStyle,
    super.textStyle,
    super.maxLength,
    super.maxNumValue,
    super.minNumValue,
    super.defaultValue,
    super.cursorColor,
    super.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return FatButton(
      text: text,
      gradient: AppGradients.inputFeild,
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(vertical: 9),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return super.build(context);
          },
        );
      },
    );
  }
}
