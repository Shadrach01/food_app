import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/features/add_card/widget/add_card_textfield.dart';
import 'package:go_router/go_router.dart';

class AddCardWidgets extends StatelessWidget {
  const AddCardWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              leadIcon: Image.asset(ImageRes.cross),
              title: const Text(
                "Add card",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      AddCardTextField(
                        text: "CARD HOLDER NAME",
                      ),
                      SizedBox(height: 20),
                      AddCardTextField(
                        text: "CARD NUMBER",
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: AddCardTextField(
                              text: "EXPIRY DATE",
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: AddCardTextField(
                              text: "CVV",
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // const SizedBox(height: 20),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            context.push('/paymentSuccessful'),
                        child: const AppContainer(
                          child: Text(
                            "ADD & MAKE PAYMENT",
                            style: TextStyle(
                              color: ColorRes.appKWhite,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
