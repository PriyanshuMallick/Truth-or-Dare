import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:truthordare/theme/app_gradients.dart';
import 'package:truthordare/theme/app_styles.dart';
import 'package:truthordare/widgets/fat_buttons_2.dart';
import 'package:truthordare/widgets/Game_card.dart';

import '../theme/app_colors.dart';
import '../utils/app_layout.dart';

class QuestionScreen extends StatelessWidget {
  final bool isTruth;
  const QuestionScreen({super.key, required this.isTruth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isTruth ? AppColors.truthBG : AppColors.dareBG,
      body: Container(
        height: AppLayout.getScreenHeight(),
        width: AppLayout.getScreenWidth(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Color.fromARGB(50, 0, 0, 0),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isTruth ? 'TRUTH' : 'DARE',
              style: AppStyles.headLineStyle2.copyWith(
                color: isTruth ? AppColors.truthText : AppColors.dareText,
              ),
            ),
            const Gap(20),
            GameCard(
              title: 'Eve',
              subTitle: 'Sing a song in public',
              gradient: isTruth ? AppGradients.truthCardBG : AppGradients.dareCardBG,
            ),
            const Gap(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FatButton(
                  text: 'COMPLETED',
                  color: isTruth ? AppColors.truthButton : AppColors.dareButton,
                  onTap: () {},
                ),
                const Gap(15),
                FatButton(
                  text: 'FORFEIT',
                  color: isTruth ? AppColors.truthButton : AppColors.dareButton,
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
