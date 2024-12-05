import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';

class PopularItems extends StatelessWidget {
  const PopularItems({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: 250,
      containerColor: ColorRes.appKWhite,
      borderRadius: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Items This Week",
                  style: TextStyle(
                    color: ColorRes.appKDarkBlack,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    color: ColorRes.containerKColor,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorRes.containerKColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                popularContainer(),
                const SizedBox(width: 10),
                popularContainer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget popularContainer() {
    return const Expanded(
      child: AppContainer(
        height: 170,
        containerColor: ColorRes.appKGrey,
        child: Column(),
      ),
    );
  }
}
