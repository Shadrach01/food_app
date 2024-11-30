import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';

Widget addNewCardButton({void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: AppContainer(
      containerColor: ColorRes.appKTransparent,
      border: Border.all(
        color: ColorRes.appKGrey.withOpacity(.2),
        width: 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageRes.plus,
            color: ColorRes.containerKColor,
          ),
          const Text(
            "ADD NEW",
            style: TextStyle(
              color: ColorRes.containerKColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
