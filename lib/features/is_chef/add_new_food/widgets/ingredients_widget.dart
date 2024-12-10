import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/widgets/app_textfields.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/features/is_chef/add_new_food/controller/add_new_food_controller.dart';
import 'package:food_app/features/is_chef/add_new_food/provider/add_new_food_notifier.dart';

class IngredientsWidget extends ConsumerWidget {
  IngredientsWidget({super.key});

  final AddNewFoodController _controller = AddNewFoodController();

  // List of icons for the ingredients

  final List<Map<String, dynamic>> basic = [
    {
      'icon': ImageRes.salt,
      'name': 'Salt',
      'isSelected': false,
    },
    {
      'icon': ImageRes.chicken,
      'name': 'Chicken',
      'isSelected': false,
    },
    {
      'icon': ImageRes.onion,
      'name': 'Onion',
      'isSelected': false,
    },
    {
      'icon': ImageRes.garlic,
      'name': 'Garlic',
      'isSelected': false,
    },
    {
      'icon': ImageRes.peppers,
      'name': 'Peppers',
      'isSelected': false,
    },
    {
      'icon': ImageRes.ginger,
      'name': 'Ginger',
      'isSelected': false,
    },
  ];

  final List<Map<String, dynamic>> fruits = [
    {
      'icon': ImageRes.avocado,
      'name': 'Avocado',
      'isSelected': false,
    },
    {
      'icon': ImageRes.apple,
      'name': 'Apple',
      'isSelected': false,
    },
    {
      'icon': ImageRes.blueberry,
      'name': 'Blueberry',
      'isSelected': false,
    },
    {
      'icon': ImageRes.broccoli,
      'name': 'Broccoli',
      'isSelected': false,
    },
    {
      'icon': ImageRes.orange,
      'name': 'Orange',
      'isSelected': false,
    },
    {
      'icon': ImageRes.walnut,
      'name': 'Walnut',
      'isSelected': false,
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems =
        ref.watch(addNewFoodNotifierProvider).ingredients;
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
          children: basic.map((ingredient) {
            return foodIngredients(
                icon: ingredient['icon'],
                name: ingredient['name'],
                isSelected:
                    selectedItems.contains(ingredient['name']),
                // _controller.selectedItems
                //     .contains(ingredient['name']),
                onTap: () {
                  _controller.updateSelectedItems(
                      ingredient['name'], ref);
                });
          }).toList(),
        ),
        const SizedBox(height: 20),
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
          children: fruits.map((ingredient) {
            return foodIngredients(
                icon: ingredient['icon'],
                name: ingredient['name'],
                isSelected:
                    selectedItems.contains(ingredient['name']),
                onTap: () {
                  _controller.updateSelectedItems(
                      ingredient['name'], ref);
                });
          }).toList(),
        ),
        const SizedBox(height: 20),
        const Text(
          "DETAILS",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 150,
          child: AppTextfield(
            controller: _controller.foodDetailsController,
            onChanged: (value) => ref
                .read(addNewFoodNotifierProvider.notifier)
                .onFoodDetailsChanged(value),
          ),
        ),
      ],
    );
  }

  // INGREDIENTS
  Widget foodIngredients({
    required String icon,
    required String name,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: isSelected
                  ? ColorRes.containerKColor.withOpacity(.5)
                  : ColorRes.appKLightGrey.withOpacity(.5),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              icon,
              color: ColorRes.containerKColor,
            ),
          ),
          Text(name),
        ],
      ),
    );
  }
}
