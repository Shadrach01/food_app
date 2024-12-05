import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/routes/app_route_names.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/features/is_chef/chef_home_page/widgets/bottom_nav_bar.dart';
import 'package:food_app/features/is_chef/chef_home_page/widgets/orders_containers.dart';
import 'package:food_app/features/is_chef/chef_home_page/widgets/popular_items.dart';
import 'package:food_app/features/is_chef/chef_home_page/widgets/reviews_container.dart';
import 'package:food_app/features/is_chef/chef_home_page/widgets/total_revenue.dart';
import 'package:go_router/go_router.dart';

class ChefHomePageWidgets extends StatelessWidget {
  const ChefHomePageWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: dashBoardPageAppBar(context),
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    OrdersContainers(),
                    SizedBox(height: 20),
                    TotalRevenue(),
                    SizedBox(height: 20),
                    ReviewsContainer(),
                    SizedBox(height: 20),
                    PopularItems(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dashBoardPageAppBar(BuildContext context) {
    return CustomAppBar(
      onLeadTapped: () =>
          context.push(AppRouteNames.chefProfileRoute),
      leadingContainerColor: ColorRes.appKWhite,
      leadIcon: Image.asset(
        ImageRes.menu,
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "LOCATION",
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
      trailingIcon: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorRes.appKGrey,
        ),
      ),
    );
  }
}
