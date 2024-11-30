import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_user/personal_profile/widgets/name_email_and_phone_number_container.dart';
import 'package:go_router/go_router.dart';

import '../../menu_page/widgets/user_info_row.dart';

class PersonalProfileWidgets extends StatelessWidget {
  const PersonalProfileWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          right: 20,
          left: 20,
        ),
        child: Column(
          children: [
            CustomAppBar(
              title: const Text(
                "Personal Info",
                style: TextStyle(fontSize: 20),
              ),
              trailingIcon: const Text(
                "EDIT",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorRes.containerKColor,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: ColorRes.containerKColor,
                ),
              ),
              onTrailingTapped: () =>
                  context.push('/editProfilePage'),
            ),
            const SizedBox(height: 40),
            const UserInfoRow(),
            const SizedBox(height: 40),
            const NameEmailAndPhoneNumberContainer(),
          ],
        ),
      ),
    );
  }
}
