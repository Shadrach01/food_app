import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/common/widgets/rate_row.dart';
import 'package:food_app/core/utils/color_res.dart';

class OpenRestaurants extends StatelessWidget {
  const OpenRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Open Restaurants",
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
        Expanded(
          child: ListView(
            children: const [
              RestaurantContainer(
                restaurantName: "Rose Garden Restaurant",
              ),
              RestaurantContainer(
                restaurantName: "Rose Garden Restaurant",
              ),
              RestaurantContainer(
                restaurantName: "Rose Garden Restaurant",
              ),
              RestaurantContainer(
                restaurantName: "Rose Garden Restaurant",
              ),
              RestaurantContainer(
                restaurantName: "Rose Garden Restaurant",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RestaurantContainer extends StatelessWidget {
  final String restaurantName;

  const RestaurantContainer({
    super.key,
    required this.restaurantName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppContainer(
            containerColor: ColorRes.appKGrey,
            height: 150,
            child: const Row(),
          ),
          const SizedBox(height: 10),
          Text(
            restaurantName,
            style: const TextStyle(
              fontSize: 23,
              color: ColorRes.appKDarkBlack,
            ),
          ),
          const Text(
            "Burger - Chicken - Riche - Wings",
            style: TextStyle(
              fontSize: 15,
              color: ColorRes.appKGrey,
            ),
          ),
          const SizedBox(height: 10),
          const RateAndDelivery(),
        ],
      ),
    );
  }
}
