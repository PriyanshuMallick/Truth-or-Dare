import 'package:flutter/material.dart';
import 'package:truthordare/theme/app_colors.dart';
import 'package:truthordare/theme/app_styles.dart';
import 'package:truthordare/widgets/circular_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuestionScreen extends StatelessWidget {
  final bool isTruth;
  const QuestionScreen({super.key, required this.isTruth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isTruth ? AppColors.truthBG : AppColors.dareBG,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: const Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: AppColors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                  child: Column(
                children: [
                  Text(
                    isTruth ? "Truth" : "Dare",
                    style: AppStyles.headLineStyle1,
                  ),
                  Text(
                    "something",
                    style: AppStyles.headLineStyle3,
                  ),
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularButton(
                    icon: FontAwesomeIcons.arrowRotateLeft,
                    bgColor: AppColors.darkBlue,
                    color: AppColors.white,
                    onTap: () => print("Skip Question"),
                  ),
                  CircularButton(
                    icon: FontAwesomeIcons.chevronRight,
                    bgColor: AppColors.darkBlue,
                    color: AppColors.white,
                    onTap: () => print("Next Screen"),
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
