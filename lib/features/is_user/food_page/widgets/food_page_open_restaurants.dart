import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/common/widgets/rate_row.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';

class FoodPageOpenRestaurants extends StatelessWidget {
  const FoodPageOpenRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Open Restaurants",
          style: TextStyle(
            fontSize: 25,
            color: ColorRes.appKBlack,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 230,
          child: ListView(
            padding: EdgeInsets.zero,
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
            height: 140,
            child: const Row(),
          ),
          const SizedBox(height: 10),
          Text(
            restaurantName,
            style: const TextStyle(
              fontSize: 20,
              color: ColorRes.appKDarkBlack,
            ),
          ),
          const SizedBox(height: 5),
          const RateAndDelivery(),
        ],
      ),
    );
  }
}
