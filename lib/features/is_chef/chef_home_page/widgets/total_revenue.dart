import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';

class TotalRevenue extends StatelessWidget {
  const TotalRevenue({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: 220,
      containerColor: ColorRes.appKWhite,
      borderRadius: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Revenue",
                      style: TextStyle(
                        color: ColorRes.appKGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "\$2,241",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                    color: ColorRes.appKTransparent,
                    border: Border.all(
                      color: ColorRes.appKLightGrey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Daily",
                        style: TextStyle(
                          color: ColorRes.appKGrey.withOpacity(.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Image.asset(
                        ImageRes.underArrow,
                        width: 15,
                        height: 15,
                      )
                    ],
                  ),
                ),
                const Text(
                  "See Details",
                  style: TextStyle(
                    color: ColorRes.containerKColor,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorRes.containerKColor,
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
