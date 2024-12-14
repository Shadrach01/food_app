import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/widgets/app_textfields.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_chef/add_new_food/controller/add_new_food_controller.dart';
import 'package:food_app/features/is_chef/add_new_food/provider/add_new_food_notifier.dart';

class PriceAndDelivery extends ConsumerWidget {
  PriceAndDelivery({super.key});

  final controller = AddNewFoodController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedOption =
        ref.watch(addNewFoodNotifierProvider).pickupOrDelivery;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "PRICE",
          style: TextStyle(
            fontSize: 16,
            color: ColorRes.appKDarkBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              height: 55,
              width: 130,
              decoration: BoxDecoration(
                color: ColorRes.appKLightGrey.withOpacity(.5),
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color: ColorRes.appKGrey.withOpacity(.4),
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "\$",
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorRes.appKGrey,
                      ),
                    ),
                  ),
                  Expanded(
                    child: AppTextfield(
                        controller: controller.foodPriceController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          ref
                              .read(
                                  addNewFoodNotifierProvider.notifier)
                              .onPriceSelected(value);
                        }),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            isCheckSelected(
              ref,
              controller,
              "Pick up",
              selectedOption,
            ),
            const SizedBox(width: 10),
            isCheckSelected(
              ref,
              controller,
              "Delivery",
              selectedOption,
            ),
          ],
        ),
      ],
    );
  }

  Widget isCheckSelected(
    WidgetRef ref,
    AddNewFoodController controller,
    String text,
    String? selectedOption,
  ) {
    return Row(
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
                controller.updatePickUpOrDelivery(ref, text);
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
    );
  }
}
