import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';

import '../../home_page/providers/food_title_provider.dart';

/// The food Image
class FoodImageContainer extends ConsumerWidget {
  const FoodImageContainer({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage(
                //       ref.watch(selectedFoodProvider)!.image!),
                // ),
                color: ColorRes.containerKColor.withOpacity(.7),
                borderRadius: const BorderRadius.only(
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
                  trailingIcon: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: ColorRes.appKWhite,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      ImageRes.heart,
                      width: 6,
                      height: 6,
                      color: ColorRes.containerKColor,
                    ),
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
