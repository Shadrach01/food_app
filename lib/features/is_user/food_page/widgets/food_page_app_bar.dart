import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';

import '../../home_page/providers/food_title_provider.dart';

/*

Custom app bar for the food page only

 */

class FoodPageAppBar extends ConsumerWidget {
  const FoodPageAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomAppBar(
      title: Container(
        height: 50,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ref.watch(selectedFoodProvider)!.title!,
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
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: ColorRes.appKDarkBlack,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              ImageRes.search,
              color: ColorRes.appKWhite,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 40,
            width: 40,
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
