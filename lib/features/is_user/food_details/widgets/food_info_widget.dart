import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/rate_row.dart';
import 'package:food_app/core/utils/color_res.dart';

class FoodInfoWidget extends StatelessWidget {
  const FoodInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name
        const Text(
          "Burger Bistro",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),
        const RateAndDelivery(),
        const SizedBox(height: 10),

        // Description
        const Text(
          "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
          style: TextStyle(
            fontSize: 17,
            color: ColorRes.appKGrey,
            height: 1.8,
          ),
          textAlign: TextAlign.justify,
        ),

        const SizedBox(height: 20),

        // Food Sizes
        Row(
          children: [
            const Text(
              "SIZE: ",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
            pizzaSize(
              ColorRes.appKGrey.withOpacity(.2),
              "10",
              ColorRes.appKDarkBlack,
            ),
            pizzaSize(
              ColorRes.containerKColor,
              "14",
              ColorRes.appKWhite,
            ),
            pizzaSize(
              ColorRes.appKGrey.withOpacity(.2),
              "16",
              ColorRes.appKDarkBlack,
            ),
          ],
        ),

        const SizedBox(height: 20),

        // FOOD INGREDIENTS
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "INGREDIENTS",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                foodIngredients(Icons.no_food_outlined),
                foodIngredients(Icons.no_food_outlined),
                foodIngredients(Icons.no_food_outlined),
                foodIngredients(Icons.no_food_outlined),
                foodIngredients(Icons.no_food_outlined),
              ],
            )
          ],
        )
      ],
    );
  }

  // Food Sizes
  Widget pizzaSize(
    Color containerColor,
    String size,
    Color textColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: containerColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$size"',
          style: TextStyle(
            fontSize: 20,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // INGREDIENTS
  Widget foodIngredients(IconData icon) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: ColorRes.containerKColor.withOpacity(.2),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: ColorRes.containerKColor,
      ),
    );
  }
}
