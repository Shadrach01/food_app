import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';

class OffersPop extends StatelessWidget {
  const OffersPop({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          const Text("Hurry Offers!"),
          const SizedBox(height: 20),
          const Text("#1233CD4"),
          const SizedBox(height: 20),
          const Text("Use the coupon to get 25% discount"),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: ColorRes.appKWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
