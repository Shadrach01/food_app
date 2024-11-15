import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:dots_indicator/dots_indicator.dart';

/*

ONBOARDING WIDGETS

*/

class OnboardingWidgets extends StatelessWidget {
  final String title;
  final String subTitle;
  final int index;
  final String image;
  const OnboardingWidgets({
    super.key,
    required this.title,
    required this.subTitle,
    required this.index,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(image),
        const SizedBox(height: 30),
        Text(
          title,
          style: const TextStyle(
              fontSize: 24,
              color: ColorRes.appKBlack,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 19,
            color: ColorRes.appKBlack,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        DotsIndicator(
          dotsCount: 4,
          position: index,
          decorator: DotsDecorator(
            size: const Size(20, 5),
            activeColor: ColorRes.containerKColor,
            color: ColorRes.containerKColor.withOpacity(.4),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
