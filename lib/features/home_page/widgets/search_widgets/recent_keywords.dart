import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Recent Keywords",
          style: TextStyle(
            fontSize: 20,
            color: ColorRes.appKBlack,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              categoriesContainer(
                isSelected: true,
                text: "All",
              ),
              categoriesContainer(text: "Hot Dog"),
              categoriesContainer(text: "Burger"),
              categoriesContainer(text: "Pizza"),
              categoriesContainer(text: "Sharwarma"),
            ],
          ),
        ),
      ],
    );
  }

  Widget categoriesContainer({
    bool isSelected = false,
    String text = '',
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
      child: IntrinsicWidth(
        child: appContainer(
          borderRadius: 50,
          containerColor: isSelected
              ? ColorRes.containerKColor.withOpacity(.5)
              : ColorRes.appKLightGrey.withOpacity(.5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 23,
                  backgroundColor: ColorRes.appKGrey,
                ),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
