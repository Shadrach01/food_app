import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/common/widgets/rate_row.dart';
import 'package:food_app/core/utils/color_res.dart';

import '../providers/home_page_service_provider.dart';

class OpenRestaurants extends ConsumerWidget {
  const OpenRestaurants({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantList = ref.watch(availableRestaurants);
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
          child: restaurantList.when(
            data: (restaurant) {
              return ListView.builder(
                itemCount: restaurant.length,
                itemBuilder: (context, index) {
                  final chef = restaurant[index];
                  return restaurantContainer(
                    restaurantName: chef.restaurantName!,
                    restaurantImage: chef.restaurantImage,
                  );
                },
              );
            },
            error: (err, stack) => Text('Error: $err'),
            loading: () => const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget restaurantContainer({
    required String restaurantName,
    String? restaurantImage,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: restaurantImage != null ? null : Colors.grey,
              borderRadius: BorderRadius.circular(20),
              image: restaurantImage != null
                  ? DecorationImage(
                      image: NetworkImage(restaurantImage),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
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
