import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';

class ReviewsContainer extends StatelessWidget {
  const ReviewsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppContainer(
      height: 110,
      containerColor: ColorRes.appKWhite,
      borderRadius: 20,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reviews",
                  style: TextStyle(
                    color: ColorRes.appKDarkBlack,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "See All Reviews",
                  style: TextStyle(
                    color: ColorRes.containerKColor,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorRes.containerKColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: ColorRes.containerKColor,
                  size: 40,
                ),
                SizedBox(width: 7),
                Text(
                  "4.8",
                  style: TextStyle(
                    color: ColorRes.containerKColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "Total 20 Reviews",
                  style: TextStyle(
                    color: ColorRes.appKDarkBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
