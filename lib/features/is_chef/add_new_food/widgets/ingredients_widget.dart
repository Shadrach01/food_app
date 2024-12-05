import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_textfields.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';

class IngredientsWidget extends StatelessWidget {
  IngredientsWidget({super.key});

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Basic",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "See All",
                  style: TextStyle(
                    color: ColorRes.appKGrey,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 5),
                Image.asset(
                  ImageRes.underArrow,
                  width: 15,
                  height: 15,
                  color: ColorRes.appKGrey,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 12,
          children: ingredientIcons.map((icon) {
            return foodIngredients(icon);
          }).toList(),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Fruits",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "See All",
                  style: TextStyle(
                    color: ColorRes.appKGrey,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 5),
                Image.asset(
                  ImageRes.underArrow,
                  width: 15,
                  height: 15,
                  color: ColorRes.appKGrey,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 10,
          runSpacing: 12,
          children: ingredientIcons.map((icon) {
            return foodIngredients(icon);
          }).toList(),
        ),
        const SizedBox(height: 16),
        const Text(
          "DETAILS",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 150,
          child: AppTextfield(),
        ),
      ],
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
