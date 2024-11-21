import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/features/search_page/widgets/popular_fast_food.dart';
import 'package:food_app/features/search_page/widgets/recent_keywords.dart';
import 'package:food_app/features/search_page/widgets/search_bar_container.dart';
import 'package:food_app/features/search_page/widgets/suggested_restaurants.dart';
import 'package:go_router/go_router.dart';

/// Screen for when the search bar is active
class SearchPageWidgets extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const SearchPageWidgets({
    super.key,
    this.controller,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomAppBar(
            title: const Text(
              "Search",
              style: TextStyle(fontSize: 20),
            ),
            trailingIcon: Badge(
              label: const Text("2"),
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: ColorRes.containerKColor,
              textColor: ColorRes.appKWhite,
              offset: const Offset(-10, 0),
              padding: const EdgeInsets.all(5),
              child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: ColorRes.appKDarkBlack,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: ColorRes.appKWhite,
                  )),
            ),
          ),
          const SizedBox(height: 25),
          SearchBarContainer(
            controller: controller,
            focusNode: focusNode,
          ),
          const SizedBox(height: 20),
          const RecentKeywords(),
          const SizedBox(height: 20),
          const Expanded(
            flex: 3,
            child: SuggestedRestaurants(),
          ),
          const SizedBox(height: 20),
          const Expanded(
            flex: 2,
            child: PopularFastFood(),
          ),
        ],
      ),
    );
  }
}
