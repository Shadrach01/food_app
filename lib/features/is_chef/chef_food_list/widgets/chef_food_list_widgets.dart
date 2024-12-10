import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/routes/app_route_names.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_chef/chef_food_list/widgets/tabs/all_widget.dart';
import 'package:food_app/features/is_chef/chef_food_list/widgets/tabs/breakfast_widget.dart';
import 'package:food_app/features/is_chef/chef_food_list/widgets/tabs/dinner_widgets.dart';
import 'package:food_app/features/is_chef/chef_food_list/widgets/tabs/lunch_widget.dart';
import 'package:go_router/go_router.dart';

class ChefFoodListWidgets extends StatelessWidget {
  // final TabController _controller = TabController();
  const ChefFoodListWidgets({super.key});

  final List<Tab> tabs = const [
    Tab(text: "All"),
    Tab(text: "Breakfast"),
    Tab(text: "Lunch"),
    Tab(text: "Dinner"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            CustomAppBar(
              onLeadTapped: () =>
                  context.go(AppRouteNames.dashBoardRoute),
              title: const Text(
                "My Food List",
                style: TextStyle(
                  fontSize: 20,
                  color: ColorRes.appKDarkBlack,
                ),
              ),
            ),
            const SizedBox(height: 20),
            DefaultTabController(
              length: 4,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      padding: const EdgeInsets.only(bottom: 30),
                      indicatorColor: ColorRes.containerKColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        color: ColorRes.containerKColor,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        color: ColorRes.appKDarkBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      tabs: tabs,
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          AllWidget(),
                          BreakfastWidget(),
                          LunchWidget(),
                          DinnerWidgets()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
