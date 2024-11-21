import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';

class RateAndDelivery extends StatelessWidget {
  final double padding;

  const RateAndDelivery({
    super.key,
    this.padding = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ImageRes.star,
                color: ColorRes.containerKColor,
              ),
              const SizedBox(width: 6),
              const Text(
                "4.7",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                ),
              )
            ],
          ),
          const SizedBox(width: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ImageRes.car,
                color: ColorRes.containerKColor,
              ),
              const SizedBox(width: 10),
              const Text(
                "Free",
                style: TextStyle(
                  fontSize: 15,
                ),
              )
            ],
          ),
          const SizedBox(width: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ImageRes.watch,
                color: ColorRes.containerKColor,
              ),
              const SizedBox(width: 10),
              const Text(
                "20 min",
                style: TextStyle(
                  fontSize: 15,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
