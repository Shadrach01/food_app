import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/widgets/food_category_container.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:go_router/go_router.dart';

import '../providers/food_title_provider.dart';

class AllCategories extends ConsumerWidget {
  const AllCategories({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "All Categories",
              style: TextStyle(
                fontSize: 20,
                color: ColorRes.appKBlack,
              ),
            ),
            Row(
              children: [
                Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 15,
                    color: ColorRes.appKBlack,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: ColorRes.appKGrey,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 170,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildFoodCategory(
                context,
                title: "Pizza",
                price: '70',
                image: ImageRes.pizza,
                ref: ref,
              ),
              _buildFoodCategory(
                context,
                title: "Burger",
                price: "30",
                image: ImageRes.burger,
                ref: ref,
              ),
              _buildFoodCategory(
                context,
                title: "Hot Dog",
                price: '50',
                image: ImageRes.hotDog,
                ref: ref,
              ),
              _buildFoodCategory(
                context,
                title: "Shawarma",
                price: '20',
                image: ImageRes.shawarma,
                ref: ref,
              ),
              _buildFoodCategory(
                context,
                title: "Fried Chicken",
                price: '37',
                image: ImageRes.friedChicken,
                ref: ref,
              ),
              _buildFoodCategory(
                context,
                title: "Milkshake",
                price: '90',
                image: ImageRes.milkshake,
                ref: ref,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFoodCategory(
    BuildContext context, {
    required String title,
    required String price,
    required String image,
    required WidgetRef ref,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: SizedBox(
        width: 140,
        child: FoodCategoryContainer(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          onTap: () {
            ref.read(selectedFoodProvider.notifier).state = title;

            context.push('/foodPage');
          },
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          subTitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Starting"),
              Text("\$$price"),
            ],
          ),
        ),
      ),
    );
  }
}
