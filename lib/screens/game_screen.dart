import 'package:flutter/material.dart';
import 'package:truthordare/screens/question_screen.dart';
import 'package:truthordare/theme/app_colors.dart';
import 'package:truthordare/widgets/fat_buttons.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FatButton(
              text: "Truth",
              bgColor: AppColors.truthBG,
              //   onTap: () => print("Truth Pressed"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QuestionScreen(isTruth: true),
                ),
              ),
            ),
            FatButton(
              text: "Dare",
              bgColor: AppColors.dareBG,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QuestionScreen(isTruth: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
