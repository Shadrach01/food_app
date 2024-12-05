import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/details_tile.dart';
import 'package:food_app/core/utils/color_res.dart';

class UsersReviewTile extends StatelessWidget {
  const UsersReviewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorRes.appKLightGrey.withOpacity(.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const DetailsTile(
        leadIcon: Icon(
          Icons.supervised_user_circle_sharp,
          color: ColorRes.containerKColor,
        ),
        title: "User Reviews",
      ),
    );
  }
}
