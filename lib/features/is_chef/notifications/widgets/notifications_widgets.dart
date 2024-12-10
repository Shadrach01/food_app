import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';

class NotificationsWidgets extends StatelessWidget {
  const NotificationsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            CustomAppBar(
              title: Text(
                'Notifications',
                style: TextStyle(
                  color: ColorRes.appKDarkBlack,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
