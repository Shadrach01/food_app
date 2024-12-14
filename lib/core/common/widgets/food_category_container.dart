import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/skeleton_widget.dart';
import 'package:food_app/core/utils/color_res.dart';

class FoodCategoryContainer extends StatelessWidget {
  final Widget title;
  final Widget subTitle;
  final DecorationImage image;
  final void Function()? onTap;

  const FoodCategoryContainer({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
    required this.image,
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
                image: image,
                // color: ColorRes.appKGrey,
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
                  title,
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

class FoodCategorySkeleton extends StatelessWidget {
  const FoodCategorySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SkeletonWidget(height: 90),
        Padding(
          padding: EdgeInsets.only(top: 5, left: 8.0, right: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonWidget(),
              SizedBox(height: 4),
              SkeletonWidget(),
            ],
          ),
        )
      ],
    );
  }
}
