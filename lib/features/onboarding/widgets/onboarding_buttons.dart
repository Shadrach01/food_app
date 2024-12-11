/*

  ONBOARDING BUTTONS

*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/routes/app_route_names.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/onboarding/provider/dot_index_provider.dart';
import 'package:go_router/go_router.dart';

class OnboardingButtons extends ConsumerWidget {
  final int index;
  final PageController controller;

  const OnboardingButtons({
    super.key,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (index < 3) {
              controller.animateToPage(
                index + 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceInOut,
              );
              ref
                  .read(indexDotProvider.notifier)
                  .changeIndex(index + 1);
            } else {
              context.go(AppRouteNames.confirmChefRoute);
            }
          },
          child: AppContainer(
            height: 50,
            child: Text(
              index < 3 ? "N E X T" : "GET STARTED",
              style: const TextStyle(
                color: ColorRes.appKWhite,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            context.go(AppRouteNames.confirmChefRoute);
          },
          child: const AppContainer(
            height: 50,
            containerColor: ColorRes.appKTransparent,
            child: Text(
              "S K I P",
              style: TextStyle(
                color: ColorRes.appKGrey,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
