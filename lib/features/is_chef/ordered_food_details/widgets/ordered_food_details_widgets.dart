import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_chef/ordered_food_details/widgets/ordered_food_images.dart';

import 'ordered_food_ingredients.dart';

class OrderedFoodDetailsWidgets extends StatelessWidget {
  const OrderedFoodDetailsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
              title: Text(
                "Food Details",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              trailingIcon: Text(
                "EDIT",
                style: TextStyle(
                  color: ColorRes.containerKColor,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const OrderedFoodImages(),
            const SizedBox(height: 20),
            const Divider(
              color: ColorRes.appKLightGrey,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    OrderedFoodIngredients(),
                    const SizedBox(height: 20),
                    const Divider(
                      color: ColorRes.appKLightGrey,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 19,
                        color: ColorRes.appKDarkBlack,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Descriptdjclu lhjcjhlohjh jhlujh huj gh lujyhm,jgyhfg,h,gikg ,kg"
                      "jhv hg,gk,g,hjhb kh gkhg hvhfkykuysgadh,g kigkygdhas kuygkg ion",
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorRes.appKGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
