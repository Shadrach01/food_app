import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/features/is_user/food_page/widgets/popular_food_grid_layout.dart';
import 'package:food_app/features/is_user/home_page/providers/food_title_provider.dart';

import 'food_page_app_bar.dart';
import 'food_page_open_restaurants.dart';

class FoodPageWidgets extends ConsumerWidget {
  const FoodPageWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodType = ref.watch(selectedFoodProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoodPageAppBar(
              title: foodType!,
            ),
            const SizedBox(height: 20),
            PopularFoodGridLayout(
              foodType: foodType,
            ),
            const SizedBox(height: 20),
            const FoodPageOpenRestaurants(),
          ],
        ),
      ),
    );
  }
}
