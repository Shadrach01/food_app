import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/routes/app_route_names.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/features/auth/log_out_controller/log_out_controller.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/details_tile.dart';

class LogOutTile extends ConsumerWidget {
  final _controller = LogOutController();

  LogOutTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        _controller.handleLogOut(ref);
        context.go(AppRouteNames.onboardingRoute);
      },
      child: Container(
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
      ),
    );
  }
}
