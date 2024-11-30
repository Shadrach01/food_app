import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/routes/app_route_names.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:go_router/go_router.dart';

import '../controller/log_out_controller/log_out_controller.dart';
import 'details_tile.dart';

class LogOutContainerWidget extends ConsumerWidget {
  final LogOutController _controller = LogOutController();

  LogOutContainerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onTap: () {
              _controller.handleLogOut(ref);
              context.go(AppRouteNames.onboardingRoute);
            },
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
