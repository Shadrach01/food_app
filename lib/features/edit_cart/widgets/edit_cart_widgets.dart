import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/edit_cart/widgets/delivery_and_place_order_container.dart';
import 'package:food_app/features/edit_cart/widgets/selected_food_widget.dart';

class EditCartWidgets extends StatelessWidget {
  const EditCartWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // App Bar
                const CustomAppBar(
                  leadIconColor: ColorRes.appKWhite,
                  title: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Cart",
                      style: TextStyle(
                        color: ColorRes.appKWhite,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  trailingIcon: Text(
                    "EDIT ITEMS",
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorRes.containerKColor,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: ColorRes.containerKColor,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // List of selected food to order
                Expanded(
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 40),
                        child: SelectedFoodWidget(
                          text: "Pizza Calzone European",
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // The delivery and place order button
          const Align(
            alignment: Alignment.bottomCenter,
            child: DeliveryAndPlaceOrderContainer(),
          ),
        ],
      ),
    );
  }
}
