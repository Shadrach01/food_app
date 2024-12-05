import 'package:flutter/material.dart';
import 'package:food_app/core/routes/app_route_names.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/details_tile.dart';

class ChefPersonalInfoTile extends StatelessWidget {
  const ChefPersonalInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 150,
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
              ImageRes.user,
              color: ColorRes.containerKColor,
            ),
            title: "Personal Info",
          ),
          const SizedBox(height: 8),
          const DetailsTile(
            leadIcon: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            title: "Settings",
          ),
        ],
      ),
    );
  }
}
