import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/auth/signup/controller/sign_up_controller.dart';
import 'package:food_app/features/auth/signup/provider/sign_up_notifier.dart';

class RestaurantImageWidget extends ConsumerStatefulWidget {
  const RestaurantImageWidget({super.key});

  @override
  ConsumerState<RestaurantImageWidget> createState() =>
      _RestaurantImageWidgetState();
}

class _RestaurantImageWidgetState
    extends ConsumerState<RestaurantImageWidget> {
  final SignUpController _controller = SignUpController();

  @override
  Widget build(BuildContext context) {
    final chefSignUpState = ref.watch(signUpNotifierProvider);

    final restaurantImage = chefSignUpState.restaurantImage;
    return Column(
      children: [
        const Text(
          "Select restaurant image or logo",
          style: TextStyle(
            fontSize: 14,
            color: ColorRes.appKDarkBlack,
          ),
        ),
        GestureDetector(
          onTap: () => _controller.pickRestaurantImage(ref),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: restaurantImage.isEmpty
                  ? ColorRes.appKLightGrey
                  : ColorRes.appKTransparent,
              borderRadius: BorderRadius.circular(15),
              border: restaurantImage.isNotEmpty
                  ? Border.all(color: ColorRes.appKTransparent)
                  : Border.all(color: ColorRes.appKGrey),
              image: restaurantImage.isNotEmpty
                  ? DecorationImage(
                      image: FileImage(
                        File(restaurantImage),
                      ),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: restaurantImage.isEmpty
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud_upload,
                          color: ColorRes.appKGrey),
                      Text(
                        "Select an image",
                        style: TextStyle(
                          color: ColorRes.appKGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
