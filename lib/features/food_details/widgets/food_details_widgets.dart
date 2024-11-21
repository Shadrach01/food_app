import 'package:flutter/material.dart';
import 'package:food_app/features/food_details/widgets/add_to_cart_widget.dart';
import 'package:food_app/features/food_details/widgets/food_image_container.dart';
import 'food_info_widget.dart';

class FoodDetailsWidgets extends StatelessWidget {
  const FoodDetailsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Column(
          children: [
            // The Food Image
            FoodImageContainer(),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),

                  // Food Name and other details
                  FoodInfoWidget(),
                ],
              ),
            ),
          ],
        ),

        // Add to Cart
        Align(
          alignment: Alignment.bottomCenter,
          child: AddToCartWidget(),
        )
      ],
    );
  }
}
