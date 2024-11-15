import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: ColorRes.appKLightGrey,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                ImageRes.menu,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "DELIVER TO",
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
          ],
        ),
        Badge(
          label: const Text("2"),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: ColorRes.containerKColor,
          textColor: ColorRes.appKWhite,
          offset: const Offset(-10, 0),
          padding: const EdgeInsets.all(5),
          child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: ColorRes.appKDarkBlack,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: ColorRes.appKWhite,
              )),
        ),
      ],
    );
  }
}
