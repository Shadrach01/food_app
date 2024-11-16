import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';

class SuggestedRestaurants extends StatelessWidget {
  const SuggestedRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Suggested Restaurants",
          style: TextStyle(
            fontSize: 20,
            color: ColorRes.appKBlack,
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: ListView(
            children: const [
              SuggestedRestaurantsTile(
                title: "Pansi Resraurant",
                rate: "4.7",
              ),
              SuggestedRestaurantsTile(
                title: "Pansi Resraurant",
                rate: "4.7",
              ),
              SuggestedRestaurantsTile(
                title: "Pansi Resraurant",
                rate: "4.7",
              ),
              SuggestedRestaurantsTile(
                title: "Pansi Resraurant",
                rate: "4.7",
              ),
              SuggestedRestaurantsTile(
                title: "Pansi Resraurant",
                rate: "4.7",
              ),
              SuggestedRestaurantsTile(
                title: "Pansi Resraurant",
                rate: "4.7",
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SuggestedRestaurantsTile extends StatelessWidget {
  final String title;
  final String rate;
  const SuggestedRestaurantsTile({
    super.key,
    required this.title,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: ColorRes.appKGrey,
              borderRadius: BorderRadius.circular(
                5,
              ),
            ),
          ),
          title: Text(title),
          subtitle: Row(
            children: [
              Image.asset(
                ImageRes.star,
                color: ColorRes.containerKColor,
                width: 30,
                height: 30,
              ),
              Text(
                rate,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
