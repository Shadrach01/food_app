import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/common/widgets/details_tile.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_chef/chef_profile/widgets/chef_personal_info_tile.dart';
import 'package:food_app/features/is_chef/chef_profile/widgets/chef_profile_app_bar.dart';
import 'package:food_app/features/is_chef/chef_profile/widgets/logout_tile.dart';
import 'package:food_app/features/is_chef/chef_profile/widgets/users_review_tile.dart';
import 'package:food_app/features/is_chef/chef_profile/widgets/withdrawal_history_tile.dart';

class ChefProfileWidgets extends StatelessWidget {
  const ChefProfileWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ChefProfileAppBar(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const ChefPersonalInfoTile(),
              const SizedBox(height: 20),
              const WithdrawalHistoryTile(),
              const SizedBox(height: 20),
              const UsersReviewTile(),
              const SizedBox(height: 20),
              LogOutTile(),
            ],
          ),
        ),
      ],
    );
  }
}
