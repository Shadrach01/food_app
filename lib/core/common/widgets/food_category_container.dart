import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/shimmer_widget.dart';
import 'package:food_app/core/utils/color_res.dart';

class FoodCategoryContainer extends StatelessWidget {
  final DecorationImage? image;
  final Widget? imagePlaceholder;
  final Widget title;
  final Widget subTitle;
  final VoidCallback? onTap;

  const FoodCategoryContainer({
    super.key,
    this.image,
    this.imagePlaceholder,
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
                image: image,
                color:
                    image == null ? ColorRes.appKTransparent : null,
                borderRadius: BorderRadius.circular(20),
              ),
              child: image == null
                  ? const ShimmerWidget(height: 90)
                  : null,
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
