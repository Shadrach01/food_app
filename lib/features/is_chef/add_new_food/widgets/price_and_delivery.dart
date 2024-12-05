import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_textfields.dart';
import 'package:food_app/core/utils/color_res.dart';

class PriceAndDelivery extends StatefulWidget {
  const PriceAndDelivery({super.key});

  @override
  State<PriceAndDelivery> createState() => _PriceAndDeliveryState();
}

class _PriceAndDeliveryState extends State<PriceAndDelivery> {
  String? selectedOption; // Stores the currently selected option

  @override
  Widget build(BuildContext context) {
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
              child: const AppTextfield(),
            ),
            const SizedBox(width: 15),
            isCheckSelected("Pick up"),
            const SizedBox(width: 10),
            isCheckSelected("Delivery"),
          ],
        ),
      ],
    );
  }

  Widget isCheckSelected(String text) {
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
              setState(
                () {
                  if (value == true) {
                    selectedOption = text; // Set the selected option
                  } else {
                    selectedOption = null; // Deselect if unchecked
                  }
                },
              );
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
