import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truthordare/theme/app_styles.dart';

import '../module/question_provider.dart';
import '../theme/app_colors.dart';
import '../widgets/fat_buttons.dart';
import 'question_screen.dart';

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
                'Choose One',
                style: AppStyles.headLineStyle1,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FatButton(
                    text: 'Truth',
                    bgColor: AppColors.truthBG,
                    onTap: () {
                      Provider.of<QuestionProvider>(context, listen: false).updateQuestion(true);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuestionScreen(isTruth: true),
                        ),
                      );
                    },
                  ),
                  FatButton(
                    text: 'Dare',
                    bgColor: AppColors.dareBG,
                    onTap: () {
                      Provider.of<QuestionProvider>(context, listen: false).updateQuestion(false);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuestionScreen(isTruth: false),
                        ),
                      );
                    },
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
