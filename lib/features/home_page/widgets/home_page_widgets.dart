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
          homePageAppBar(),
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

  // App bar for the home page from the custom App AppBar
  Widget homePageAppBar() {
    return CustomAppBar(
      leadingContainerColor: ColorRes.appKGrey.withOpacity(.2),
      trailingContainerColor: ColorRes.appKDarkBlack,
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
      trailingIcon: const Badge(
        label: Text("2"),
        textStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: ColorRes.containerKColor,
        textColor: ColorRes.appKWhite,
        offset: Offset(-10, 0),
        padding: EdgeInsets.all(5),
        child: Center(
          child: Icon(
            Icons.shopping_bag_outlined,
            color: ColorRes.appKWhite,
          ),
        ),
      ),
    );
  }
}
