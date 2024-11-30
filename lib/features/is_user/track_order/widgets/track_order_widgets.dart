import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_user/track_order/widgets/delivery_address_container.dart';

class TrackOrderWidgets extends StatelessWidget {
  const TrackOrderWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 80,
          ),
          child: Column(
            children: [
              CustomAppBar(
                leadingContainerColor: ColorRes.appKDarkBlack,
                leadIconColor: ColorRes.appKWhite,
                title: Text(
                  "Track Order",
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorRes.appKDarkBlack,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: DeliveryAddressContainer(),
        )
      ],
    );
  }
}
