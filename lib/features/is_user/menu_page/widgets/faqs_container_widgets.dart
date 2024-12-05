import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';

import '../../../../core/common/widgets/details_tile.dart';

class FaqsContainerWidgets extends StatelessWidget {
  const FaqsContainerWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 210,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorRes.appKLightGrey.withOpacity(.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DetailsTile(
            leadIcon: Image.asset(
              ImageRes.question,
              color: ColorRes.containerKColor,
            ),
            title: "FAQs",
          ),
          const SizedBox(height: 8),
          const DetailsTile(
            leadIcon: Icon(
              Icons.supervised_user_circle_rounded,
              color: Colors.blue,
            ),
            title: "User Reviews",
          ),
          const SizedBox(height: 8),
          DetailsTile(
            leadIcon: Image.asset(
              ImageRes.bell,
              width: 20,
              height: 20,
              color: Colors.blue.shade900,
            ),
            title: "Settings",
          ),
        ],
      ),
    );
  }
}
