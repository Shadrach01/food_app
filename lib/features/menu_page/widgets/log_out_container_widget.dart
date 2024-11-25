import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'details_tile.dart';

class LogOutContainerWidget extends StatelessWidget {
  const LogOutContainerWidget({super.key});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DetailsTile(
            leadIcon: Image.asset(
              ImageRes.logout,
              color: ColorRes.containerKColor,
            ),
            title: "Log Out",
          ),
        ],
      ),
    );
  }
}
