import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/widgets/food_category_container.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:go_router/go_router.dart';

import '../../home_page/providers/food_title_provider.dart';

class PopularFoodGridLayout extends ConsumerWidget {
  const PopularFoodGridLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(selectedFoodProvider)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular ${text.title!}",
          style: const TextStyle(
            fontSize: 20,
            color: ColorRes.appKBlack,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 380,
          child: GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Set the number of columns to 2
              crossAxisSpacing: 40, // Space between row
              mainAxisSpacing: 20, // Space between columns
              childAspectRatio:
                  .9, // Controls the aspect ratio of each item
            ),
            itemCount: 10, // The number of items to display
            itemBuilder: (context, index) {
              return foodTypeContainer(context, ref);
            },
          ),
        ),
      ],
    );
  }

  Widget foodTypeContainer(BuildContext context, WidgetRef ref) {
    final foodDetails = ref.watch(selectedFoodProvider)!;
    return GestureDetector(
      onTap: () => context.push('/foodDetails'),
      child: FoodCategoryContainer(
        image: foodDetails.image!,
        title: "Pansi Restaurant",
        subTitle: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Uttora Coffee House",
              style: TextStyle(
                color: ColorRes.appKGrey,
                fontSize: 13,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${foodDetails.price!}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    color: ColorRes.containerKColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: ColorRes.appKWhite,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
