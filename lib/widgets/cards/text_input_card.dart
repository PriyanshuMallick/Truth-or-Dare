import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truthordare/theme/app_colors.dart';
import 'package:truthordare/theme/app_gradients.dart';
import 'package:truthordare/widgets/cards/stacked_cards.dart';

import '../../theme/app_styles.dart';

String? _error;
String _inputValue = '';

class TextInputCard extends StatelessWidget {
  final bool isAlphaNumeric;
  final String title;
  final TextStyle titleStyle;
  final TextStyle textStyle;
  final int maxLength;
  final int? maxNumValue;
  final int? minNumValue;
  final bool defaultValue;
  final void Function(String) onDone;
  final Color? cursorColor;
  final Color accentColor;

  const TextInputCard({
    super.key,
    required this.title,
    required this.onDone,
    this.isAlphaNumeric = true,
    this.titleStyle = AppStyles.cardTitle_2,
    this.textStyle = AppStyles.cardSubtitle,
    this.maxLength = 10,
    this.maxNumValue,
    this.minNumValue,
    this.defaultValue = true,
    this.cursorColor = AppColors.lightPurple,
    this.accentColor = AppColors.lighterPurple,
  });

  void _onTextChanged(String value) {
    if (!isAlphaNumeric) {
      _error = _validateNumericInput(value);
      if (_error != null) return;
    }
    _inputValue = isAlphaNumeric ? value : value.replaceAll(RegExp(r'[^0-9]'), '');
  }

  String? _validateNumericInput(String? value) {
    if (value == null || value.isEmpty && defaultValue == false) {
      return 'Please enter a value';
    }

    int? numericValue = int.tryParse(value);
    if (numericValue == null) {
      return 'Please enter a valid number';
    }

    if (minNumValue == null && maxNumValue == null) {
      return null;
    }

    if ((minNumValue != null && maxNumValue != null) && (numericValue < minNumValue! || numericValue > maxNumValue!)) {
      return 'Please enter a number between ${minNumValue!} and ${maxNumValue!}';
    }

    if (minNumValue != null && numericValue < minNumValue!) {
      return 'Please enter a number more than ${minNumValue!}';
    }

    if (maxNumValue != null && numericValue > maxNumValue!) {
      return 'Please enter a number less than ${maxNumValue!}';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,

      //
      content: StackedCards(
        repeat: 3,
        gradients: const [AppGradients.purpleCardBG],
        cardHeight: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
              TextField(
                onChanged: _onTextChanged,
                autofocus: true,
                textAlign: TextAlign.center,
                style: AppStyles.cardSubtitle,
                textCapitalization: TextCapitalization.words,
                cursorColor: cursorColor,
                maxLength: maxLength,

                keyboardAppearance: Brightness.dark,
                keyboardType: isAlphaNumeric ? TextInputType.text : TextInputType.number,

                // UnderLine color
                decoration: InputDecoration(
                  counterStyle: TextStyle(
                    color: accentColor, // Change maximum length text color
                    fontSize: 12, // Change maximum length text font size
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: accentColor,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: accentColor.withOpacity(.5)), // Change enabled underline color
                  ),
                ),
              ),

              //? ---------------------------- ❌ Buttons ✔️ ----------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 30,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      FontAwesomeIcons.xmark,
                      color: accentColor,
                    ),
                  ),
                  IconButton(
                    iconSize: 30,
                    onPressed: () {
                      if (_error != null) {
                        Fluttertoast.showToast(msg: _error!);
                        return;
                      }
                      Navigator.of(context).pop();
                      onDone(_inputValue.trim());
                    },
                    icon: Icon(
                      FontAwesomeIcons.check,
                      color: accentColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
