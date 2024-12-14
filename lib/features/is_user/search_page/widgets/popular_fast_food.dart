import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/food_category_container.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';

class PopularFastFood extends StatelessWidget {
  const PopularFastFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Available Fast Food",
          style: TextStyle(
            fontSize: 20,
            color: ColorRes.appKBlack,
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: GridView.builder(
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Set the number of cloumns to 2
              crossAxisSpacing: 30, // Space between row
              mainAxisSpacing: 15, // Space between columns
              childAspectRatio:
                  1.1, // Controls the aspect ratio of each item
            ),
            itemCount: 10, // The number of items to display
            itemBuilder: (context, index) {
              return const FoodCategoryContainer(
                image: DecorationImage(
                  image: AssetImage(ImageRes.pizza),
                  fit: BoxFit.cover,
                ),
                title: Text(
                  "Title Here",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subTitle: Text(
                  "Uttora Coffee House",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
