import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/edit_profile/widgets/edit_profile_text_fields.dart';

class EditProfileWidgets extends StatelessWidget {
  const EditProfileWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomAppBar(
              title: Text(
                "Edit Profile",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),

            // Profile image
            Stack(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor:
                      ColorRes.containerKColor.withOpacity(.4),
                ),
                Positioned(
                  top: 75,
                  left: 70,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      color: ColorRes.containerKColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.edit_outlined,
                        color: ColorRes.appKWhite,
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Expanded(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  EditProfileTextFields(
                    text: "FULL NAME",
                  ),
                  SizedBox(height: 20),
                  EditProfileTextFields(
                    text: "EMAIL",
                  ),
                  SizedBox(height: 20),
                  EditProfileTextFields(
                    text: "PHONE NUMBER",
                  ),
                  SizedBox(height: 20),
                  EditProfileTextFields(
                    text: "BIO",
                  ),
                ],
              ),
            ),

            const Column(
              children: [
                AppContainer(
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                      color: ColorRes.appKWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
