import 'package:flutter/material.dart';
import 'package:truthordare/theme/app_styles.dart';

import '../theme/app_colors.dart';
import '../widgets/fat_buttons.dart';
import 'question_screen_2.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [Colors.white.withOpacity(0), const Color.fromRGBO(255, 0, 0, 0.35)],
      //     stops: const [0.7313, 1.0],
      //   ),
      //   boxShadow: const [
      //     BoxShadow(
      //       color: Color(0xFFBCE2FF),
      //       offset: Offset(0, -3),
      //       blurRadius: 0,
      //     ),
      //     BoxShadow(
      //       color: Color.fromARGB(45, 240, 249, 255),
      //       offset: Offset(0, -3),
      //       blurRadius: 0,
      //     ),
      //   ],
      // ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.blue.shade400,
          Colors.red.shade300,
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Choose One",
                style: AppStyles.headLineStyle1,
                textAlign: TextAlign.center,
              ),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}
