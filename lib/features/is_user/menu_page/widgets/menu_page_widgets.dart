import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_user/menu_page/widgets/personal_info_tile.dart';
import 'package:food_app/features/is_user/menu_page/widgets/user_info_row.dart';
import 'cart_container_widgets.dart';
import 'faqs_container_widgets.dart';
import 'log_out_container_widget.dart';

class MenuPageWidgets extends StatelessWidget {
  const MenuPageWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 35,
        ),
        child: Column(
          children: [
            CustomAppBar(
              title: const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              trailingIcon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorRes.appKGrey.withOpacity(.2),
                ),
                child: const Center(
                  child: Icon(
                    Icons.more_horiz,
                    color: ColorRes.appKDarkBlack,
                    size: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const UserInfoRow(),
                    const SizedBox(height: 40),
                    const PersonalInfoTile(),
                    const SizedBox(height: 20),
                    const CartContainerWidgets(),
                    const SizedBox(height: 20),
                    const FaqsContainerWidgets(),
                    const SizedBox(height: 20),
                    LogOutContainerWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
