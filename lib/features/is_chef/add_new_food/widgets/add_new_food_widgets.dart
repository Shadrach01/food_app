import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/common/widgets/app_textfields.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/routes/app_route_names.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_chef/add_new_food/widgets/ingredients_widget.dart';
import 'package:food_app/features/is_chef/add_new_food/widgets/price_and_delivery.dart';
import 'package:food_app/features/is_chef/add_new_food/widgets/upload_food_image_widgets.dart';
import 'package:go_router/go_router.dart';

class AddNewFoodWidgets extends StatelessWidget {
  const AddNewFoodWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              onLeadTapped: () =>
                  context.push(AppRouteNames.dashBoardRoute),
              title: const Text(
                "Add New Items",
                style: TextStyle(
                  fontSize: 20,
                  color: ColorRes.appKDarkBlack,
                ),
              ),
              trailingIcon: const Text(
                "RESET",
                style: TextStyle(
                  color: ColorRes.containerKColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ITEM NAME",
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorRes.appKDarkBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        AppTextfield(
                          hintText: "Chicken Biriyani",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const UploadFoodImageWidgets(),
                    const SizedBox(height: 20),
                    const PriceAndDelivery(),
                    const SizedBox(height: 20),
                    IngredientsWidget(),
                    const SizedBox(height: 20),
                    const AppContainer(
                        child: Text(
                      "SAVE CHANGES",
                      style: TextStyle(
                        color: ColorRes.appKWhite,
                        fontSize: 20,
                      ),
                    ))
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
