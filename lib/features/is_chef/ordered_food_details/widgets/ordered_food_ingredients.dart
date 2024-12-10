import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';

class OrderedFoodIngredients extends StatelessWidget {
  OrderedFoodIngredients({super.key});

  // List of icons for the ingredients
  final List<IconData> ingredientIcons = [
    Icons.apple,
    Icons.bakery_dining,
    Icons.coffee,
    Icons.rice_bowl,
    Icons.icecream,
    Icons.local_pizza,
    Icons.local_drink,
    Icons.no_food_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "INGREDIENTS",
          style: TextStyle(
            fontSize: 16,
            color: ColorRes.appKDarkBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 15,
          runSpacing: 20,
          children: ingredientIcons.map((icon) {
            return foodIngredients(icon);
          }).toList(),
        ),
      ],
    );
  }

  // INGREDIENTS
  Widget foodIngredients(IconData icon) {
    return Column(
      children: [
        Container(
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
        ),
        Text("Chicken")
      ],
    );
  }
}
