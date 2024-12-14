import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/widgets/food_category_container.dart';
import 'package:food_app/core/common/widgets/skeleton_widget.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_user/home_page/providers/home_page_service_provider.dart';
import 'package:go_router/go_router.dart';

class PopularFoodGridLayout extends ConsumerWidget {
  final String foodType;

  const PopularFoodGridLayout({
    super.key,
    required this.foodType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodList = ref.watch(availableFoodProvider(foodType));
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Popular food",
          style: TextStyle(
            fontSize: 20,
            color: ColorRes.appKBlack,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 380,
          child: foodList.when(
            data: (foods) => GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // Set the number of columns to 2
                crossAxisSpacing: 40,
                // Space between row
                mainAxisSpacing: 20,
                // Space between columns
                childAspectRatio:
                    .9, // Controls the aspect ratio of each item
              ),
              itemCount:
                  foods.length, // The number of items to display
              itemBuilder: (context, index) {
                final food = foods[index];
                return foodTypeContainer(
                  context,
                  ref,
                  food.foodName!,
                  food.foodDetails!,
                  food.price!,
                  food.foodImages![0],
                );
              },
            ),
            error: (err, stack) => Text('Error: $err'),
            loading: () => GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // Set the number of columns to 2
                crossAxisSpacing: 40,
                // Space between row
                mainAxisSpacing: 20,
                // Space between columns
                childAspectRatio:
                    .9, // Controls the aspect ratio of each item
              ),
              itemCount: 5, // The number of items to display
              itemBuilder: (context, index) {
                return const FoodCategorySkeleton();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget foodTypeContainer(
    BuildContext context,
    WidgetRef ref,
    String foodName,
    String foodDetails,
    String foodPrice,
    String image,
  ) {
    return GestureDetector(
      onTap: () => context.push('/foodDetails'),
      child: FoodCategoryContainer(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
        title: Text(
          foodName,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        subTitle: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              foodDetails,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: ColorRes.appKGrey,
                fontSize: 13,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$$foodPrice",
                  style: TextStyle(
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
