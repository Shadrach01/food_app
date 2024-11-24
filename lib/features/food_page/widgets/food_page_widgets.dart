import 'package:flutter/material.dart';
import 'package:food_app/features/food_page/widgets/food_page_app_bar.dart';
import 'package:food_app/features/food_page/widgets/popular_food_grid_layout.dart';

import 'food_page_open_restaurants.dart';

class FoodPageWidgets extends StatelessWidget {
  const FoodPageWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          right: 20,
          left: 20,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoodPageAppBar(),
            SizedBox(height: 20),
            PopularFoodGridLayout(),
            SizedBox(height: 20),
            FoodPageOpenRestaurants(),
          ],
        ),
      ),
    );
  }
}
