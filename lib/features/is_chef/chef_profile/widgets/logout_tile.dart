import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';

import '../../../../core/common/widgets/details_tile.dart';

class LogOutTile extends StatelessWidget {
  const LogOutTile({super.key});

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
      child: DetailsTile(
        leadIcon: Image.asset(
          ImageRes.logout,
          color: ColorRes.containerKColor,
        ),
        title: "Log Out",
      ),
    );
  }
}
