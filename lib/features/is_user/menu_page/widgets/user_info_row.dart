import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: ColorRes.containerKColor,
          radius: 40,
        ),
        SizedBox(width: 25),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Samuel Shadrach",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 7),
            Text(
              "I love fast food",
              style: TextStyle(
                fontSize: 17,
                color: ColorRes.appKGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
