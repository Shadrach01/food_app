import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/food_category_container.dart';
import 'package:food_app/core/utils/color_res.dart';

class PopularFoodGridLayout extends StatelessWidget {
  const PopularFoodGridLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Popular Burgers",
          style: TextStyle(
            fontSize: 20,
            color: ColorRes.appKBlack,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 380,
          child: GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Set the number of columns to 2
              crossAxisSpacing: 40, // Space between row
              mainAxisSpacing: 20, // Space between columns
              childAspectRatio:
                  .9, // Controls the aspect ratio of each item
            ),
            itemCount: 10, // The number of items to display
            itemBuilder: (context, index) {
              return foodTypeContainer();
            },
          ),
        ),
      ],
    );
  }

  Widget foodTypeContainer() {
    return FoodCategoryContainer(
      title: "Pansi Restaurant",
      subTitle: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Uttora Coffee House",
            style: TextStyle(
              color: ColorRes.appKGrey,
              fontSize: 13,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "\$75",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  color: ColorRes.containerKColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: ColorRes.appKWhite,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
