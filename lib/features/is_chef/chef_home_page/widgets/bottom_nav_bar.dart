import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        color: ColorRes.appKWhite,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorRes.appKLightGrey,
            blurRadius: .5,
            spreadRadius: .3,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            ImageRes.chefPageHomeIcon,
            width: 30,
            height: 30,
          ),
          Icon(
            Icons.menu,
            size: 30,
            color: ColorRes.appKGrey.withOpacity(.6),
          ),
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorRes.containerKColor.withOpacity(.2),
              border: Border.all(
                color: ColorRes.containerKColor,
                width: 2,
              ),
            ),
            child: Image.asset(
              ImageRes.plus,
              color: ColorRes.containerKColor,
            ),
          ),
          Image.asset(
            ImageRes.bell,
            color: ColorRes.appKGrey.withOpacity(.6),
          ),
          Image.asset(
            ImageRes.user,
            color: ColorRes.appKGrey.withOpacity(.6),
          )
        ],
      ),
    );
  }
}
