import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:go_router/go_router.dart';

/*

Custom app bar for the food page only

 */

class FoodPageAppBar extends StatelessWidget {
  const FoodPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leadIcon: Image.asset(
        ImageRes.icon,
        color: ColorRes.appKDarkBlack,
      ),
      onLeadTapped: () => context.pop(),
      title: Container(
        height: 50,
        width: 120,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorRes.appKGrey.withOpacity(.2),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "BURGER",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 14,
              ),
            ),
            Image.asset(
              ImageRes.polygon,
              color: ColorRes.containerKColor,
              width: 17,
              height: 17,
            )
          ],
        ),
      ),
      trailingIcon: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
              color: ColorRes.appKDarkBlack,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              ImageRes.search,
              color: ColorRes.appKWhite,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: ColorRes.appKGrey.withOpacity(.23),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              ImageRes.filter,
              color: ColorRes.appKDarkBlack,
            ),
          ),
        ],
      ),
    );
  }
}
