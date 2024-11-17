import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';

class FoodCategoryContainer extends StatelessWidget {
  final String title;
  final Widget subTitle;
  final void Function()? onTap;

  const FoodCategoryContainer({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: ColorRes.appKWhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              spreadRadius: .8,
              blurRadius: .6,
              blurStyle: BlurStyle.outer,
              color: ColorRes.appKLightGrey,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: ColorRes.appKGrey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 8.0, right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  subTitle,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
