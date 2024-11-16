import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';

class PopularFastFood extends StatelessWidget {
  const PopularFastFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Popular Fast Food",
          style: TextStyle(
            fontSize: 20,
            color: ColorRes.appKBlack,
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Set the number of cloumns to 2
              crossAxisSpacing: 30, // Space between row
              mainAxisSpacing: 15, // Space between columns
              childAspectRatio: 1.1, // Controls the aspect ratio of each item
            ),
            itemCount: 10, // The number of items to display
            itemBuilder: (context, index) {
              return const PopularFastFoodContainer(
                title: "Pansi Restaurant",
                subTitle: "Uttora Coffee House",
              );
            },
          ),
        )
      ],
    );
  }
}

class PopularFastFoodContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  const PopularFastFoodContainer({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: ColorRes.appKWhite,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            spreadRadius: .8,
            blurRadius: .6,
            blurStyle: BlurStyle.outer,
            color: ColorRes.appKLightGrey,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
              color: ColorRes.appKGrey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
