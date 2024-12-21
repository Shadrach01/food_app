import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/widgets/rate_row.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_user/home_page/providers/home_page_service_provider.dart';

class FoodPageOpenRestaurants extends ConsumerWidget {
  const FoodPageOpenRestaurants({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantList = ref.watch(availableRestaurants);
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
          child: restaurantList.when(
            data: (restaurants) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  final chef = restaurants[index];
                  return restaurantContainer(
                      restaurantImage: chef.restaurantImage,
                      restaurantName: chef.restaurantName!);
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

  Widget restaurantContainer(
      {required String restaurantName, String? restaurantImage}) {
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
