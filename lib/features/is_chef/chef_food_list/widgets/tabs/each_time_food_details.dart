import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';

class EachTimeFoodDetails extends StatelessWidget {
  final String time;

  const EachTimeFoodDetails({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130,
          width: 140,
          decoration: BoxDecoration(
            color: ColorRes.appKLightGrey,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Utora Coffee House",
              style: TextStyle(
                color: ColorRes.appKDarkBlack,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: ColorRes.containerKColor.withOpacity(.3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                time,
                style: const TextStyle(
                  color: ColorRes.containerKColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: ColorRes.containerKColor,
                  size: 15,
                ),
                // SizedBox(width: 7),
                Text(
                  "4.8",
                  style: TextStyle(
                    color: ColorRes.containerKColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "(Total 20 Reviews)",
                  style: TextStyle(
                    color: ColorRes.appKGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(width: 17),
        const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.more_horiz,
              color: ColorRes.appKDarkBlack,
            ),
            SizedBox(height: 15),
            Text(
              "\$39",
              style: TextStyle(
                color: ColorRes.appKDarkBlack,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Pick up",
              style: TextStyle(
                color: ColorRes.appKGrey,
              ),
            )
          ],
        )
      ],
    );
  }
}
