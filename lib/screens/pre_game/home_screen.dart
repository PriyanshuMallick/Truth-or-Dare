import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_styles.dart';
import '../../widgets/buttons/fat_buttons.dart';
import '../../widgets/stylish/gradient_stack.dart';
import '../../utils/question_provider.dart';
import '../question_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientStack(
      gradients: const [
        AppGradients.homeScreen,
        AppGradients.transparent2Black,
      ],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'TRUTH\nOR\nDARE',
              textAlign: TextAlign.center,
              style: AppStyles.headLineStyle1,
            ),

            //? Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FatButton(
                  text: 'Truth',
                  //   bgColor: AppColors.truthBG,
                  bgColor: AppColors.purple,
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
                  //   bgColor: AppColors.dareBG,
                  bgColor: AppColors.purple,
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
    );
  }
}
