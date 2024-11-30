import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/features/auth/chef_or_user/stateProvider/is_chef_state_provider.dart';

import '../provider/is_chef_supabase_update.dart';

class ChefOrUserWidgets extends ConsumerStatefulWidget {
  const ChefOrUserWidgets({super.key});

  @override
  ConsumerState<ChefOrUserWidgets> createState() =>
      _ChefOrUserWidgetsState();
}

class _ChefOrUserWidgetsState
    extends ConsumerState<ChefOrUserWidgets> {
  late IsChefUpdate _isChefUpdate;

  @override
  void didChangeDependencies() {
    _isChefUpdate = IsChefUpdate();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the provider to get the current value
    final isChef = ref.watch(isChefProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImageRes.onboarding_3),
          const SizedBox(height: 30),
          const Text(
            "Are you a chef?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          RadioListTile(
            title: const Text(
              "Yes I am",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorRes.appKGrey,
              ),
            ),
            value: true,
            groupValue: isChef,
            activeColor: ColorRes.containerKColor,
            onChanged: (value) {
              // Update the state using RiverPod's notifier
              ref.read(isChefProvider.notifier).state = value;
            },
          ),
          RadioListTile(
            title: const Text(
              "No! I'm just here to eat",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorRes.appKGrey,
              ),
            ),
            value: false,
            groupValue: isChef,
            activeColor: ColorRes.containerKColor,
            onChanged: (value) {
              // Update the state using RiverPod's notifier
              ref.read(isChefProvider.notifier).state = value;
            },
          ),
          const SizedBox(height: 100),
          GestureDetector(
            onTap: () => _isChefUpdate.updateUserIsChef(context, ref),
            child: const AppContainer(
              child: Text(
                "Continue",
                style: TextStyle(
                  color: ColorRes.appKWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
