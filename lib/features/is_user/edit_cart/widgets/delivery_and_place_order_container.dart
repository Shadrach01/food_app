import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/common/widgets/app_textfields.dart';
import 'package:food_app/core/routes/app_route_names.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:go_router/go_router.dart';

class DeliveryAndPlaceOrderContainer extends StatelessWidget {
  const DeliveryAndPlaceOrderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      height: 360,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: ColorRes.appKWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "DELIVERY ADDRESS",
                style: TextStyle(
                  fontSize: 20,
                  color: ColorRes.appKGrey,
                ),
              ),
              Text(
                "EDIT",
                style: TextStyle(
                  color: ColorRes.containerKColor,
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorRes.containerKColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const AppTextfield(
            readOnly: true,
            hintText: "2118, ADIGBE STREET, LONDON",
          ),
          const SizedBox(height: 45),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "TOTAL:",
                    style: TextStyle(
                      color: ColorRes.appKGrey,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "\$96",
                    style: TextStyle(
                      color: ColorRes.appKDarkBlack,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Breakdown",
                    style: TextStyle(
                      color: ColorRes.containerKColor,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 60),
          placeOrderButton(
            onTap: () =>
                context.push(AppRouteNames.paymentMethodRoute),
          ),
        ],
      ),
    );
  }

  // Add to cart button
  Widget placeOrderButton({void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: const AppContainer(
        child: Text(
          "PLACE ORDER",
          style: TextStyle(
            color: ColorRes.appKWhite,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
