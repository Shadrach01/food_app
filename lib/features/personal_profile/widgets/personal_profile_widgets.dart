import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/menu_page/widgets/user_info_row.dart';
import 'package:food_app/features/personal_profile/widgets/name_email_and_phone_number_container.dart';

class PersonalProfileWidgets extends StatelessWidget {
  const PersonalProfileWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: 30,
          right: 20,
          left: 20,
        ),
        child: Column(
          children: [
            CustomAppBar(
              title: Text(
                "Personal Info",
                style: TextStyle(fontSize: 20),
              ),
              trailingIcon: Text(
                "EDIT",
                style: TextStyle(
                  fontSize: 16,
                  color: ColorRes.containerKColor,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: ColorRes.containerKColor,
                ),
              ),
            ),
            SizedBox(height: 40),
            UserInfoRow(),
            SizedBox(height: 20),
            NameEmailAndPhoneNumberContainer(),
          ],
        ),
      ),
    );
  }
}
