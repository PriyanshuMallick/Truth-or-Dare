import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:truthordare/screens/bottom_nav_bar.dart';
import 'package:truthordare/theme/app_colors.dart';
import 'package:truthordare/theme/app_gradients.dart';
import 'package:truthordare/theme/app_styles.dart';
import 'package:truthordare/widgets/buttons/fat_buttons.dart';
import 'package:truthordare/widgets/stylish/gradient_stack.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientStack(
        gradients: AppGradients.mainScreenBG,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Truth\nor\nDare'.toUpperCase(),
                  style: AppStyles.headLineStyle1,
                  textAlign: TextAlign.center,
                ),
                const Gap(50),
                FatButton(
                  text: 'Tap to begin!',
                  width: 280,
                  height: 55,
                  bgColor: AppColors.purple,
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const BottomNavBar()),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
