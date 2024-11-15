import 'package:flutter/material.dart';
import 'package:food_app/core/routes/go_router_provider.dart';
import 'package:food_app/features/home_page/widgets/all_categories.dart';
import 'package:food_app/features/home_page/widgets/home_page_app_bar.dart';
import 'package:food_app/features/home_page/widgets/open_restaurants.dart';
import 'package:food_app/features/home_page/widgets/search_widgets/search_bar_container.dart';
import 'package:go_router/go_router.dart';

class HomePageWidgets extends StatelessWidget {
  final TextEditingController? searchBarController;
  final void Function()? onTap;
  const HomePageWidgets({
    super.key,
    this.searchBarController,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const HomePageAppBar(),
          const SizedBox(height: 35),
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
              onTap: () => context.push('/homeSearchPage')
          ),
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
