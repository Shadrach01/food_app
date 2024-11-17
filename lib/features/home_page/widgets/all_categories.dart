import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/food_category_container.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:go_router/go_router.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
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
                title: "Hot Dog",
                price: '70',
              ),
              _buildFoodCategory(
                context,
                title: "Pizza",
                price: "30",
              ),
              _buildFoodCategory(
                context,
                title: "Hot Dog",
                price: '50',
              ),
              _buildFoodCategory(
                context,
                title: "Burger",
                price: '20',
              ),
              _buildFoodCategory(
                context,
                title: "Pizza",
                price: '37',
              ),
              _buildFoodCategory(
                context,
                title: "Sharwarma",
                price: '90',
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
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 110,
        child: FoodCategoryContainer(
          onTap: () => context.push('/foodPage'),
          title: title,
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
