import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:go_router/go_router.dart';

/// The food Image
class FoodImageContainer extends StatelessWidget {
  const FoodImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: const BoxDecoration(
                color: ColorRes.appKGrey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            Positioned(
              top: 60,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CustomAppBar(
                  leadingContainerColor: ColorRes.appKWhite,
                  trailingContainerColor: ColorRes.appKWhite,
                  onLeadTapped: () => context.pop(),
                  leadIcon: Image.asset(
                    ImageRes.icon,
                    width: 30,
                    height: 30,
                    color: ColorRes.appKDarkBlack,
                  ),
                  trailingIcon: Image.asset(
                    ImageRes.heart,
                    width: 6,
                    height: 6,
                    color: ColorRes.containerKColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
