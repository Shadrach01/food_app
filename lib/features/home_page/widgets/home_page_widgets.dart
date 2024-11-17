import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/features/home_page/widgets/all_categories.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/features/home_page/widgets/open_restaurants.dart';
import 'package:food_app/features/search_page/widgets/search_bar_container.dart';
import 'package:go_router/go_router.dart';

class HomePageWidgets extends StatelessWidget {
  final void Function()? onTap;
  final TextEditingController? searchBarController;
  final FocusNode? focusNode;

  const HomePageWidgets({
    super.key,
    this.onTap,
    this.searchBarController,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomAppBar(
            leadIcon: Image.asset(
              ImageRes.menu,
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "DELIVER TO",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorRes.containerKColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Dumaks Office",
                    ),
                    const SizedBox(width: 5),
                    Image.asset(
                      ImageRes.polygon,
                      width: 15,
                      height: 15,
                    )
                  ],
                ),
              ],
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
          const Row(
            children: [
              Text(
                "Hey Bami, ",
                style: TextStyle(fontSize: 16),
              ),
              // SizedBox(width: 10),
              Text(
                "Good Afternoon",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SearchBarContainer(
              controller: searchBarController,
              focusNode: focusNode,
              onTap: () {
                // Hide the device keyboard before navigating
                focusNode?.unfocus();

                // Navigate to the search page
                context.push(
                  '/homeSearchPage',
                );
              }),
          const SizedBox(height: 30),
          const AllCategories(),
          const SizedBox(height: 30),
          const Expanded(
            child: OpenRestaurants(),
          ),
        ],
      ),
    );
  }
}
