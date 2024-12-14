import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_chef/add_new_food/provider/add_new_food_notifier.dart';

import '../controller/add_new_food_controller.dart';

class FoodTypeCheckbox extends ConsumerWidget {
  FoodTypeCheckbox({super.key});

  final controller = AddNewFoodController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedOption =
        ref.watch(addNewFoodNotifierProvider).foodType;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          isCheckSelected(
              ref, controller, "Shawarma", selectedOption),
          isCheckSelected(ref, controller, "Pizza", selectedOption),
          isCheckSelected(ref, controller, "Burger", selectedOption),
          isCheckSelected(
              ref, controller, "Fried Chicken", selectedOption),
          isCheckSelected(
              ref, controller, "MilkShake", selectedOption),
          isCheckSelected(ref, controller, "Hot Dog", selectedOption),
        ],
      ),
    );
  }

  Widget isCheckSelected(
    WidgetRef ref,
    AddNewFoodController controller,
    String text,
    String? selectedOption,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              // Only if this option is selected
              value: selectedOption == text,
              focusColor: ColorRes.containerKColor,
              activeColor: ColorRes.appKTransparent,
              checkColor: ColorRes.containerKColor,
              side: selectedOption == text
                  ? const BorderSide(
                      color: ColorRes.containerKColor,
                      width: 2,
                    )
                  : const BorderSide(
                      color: ColorRes.appKLightGrey,
                      width: 2,
                    ),
              onChanged: (value) {
                if (value == true) {
                  controller.updateFoodType(ref, text);
                }
              },
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: ColorRes.appKGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
