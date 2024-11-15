import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';

Widget appContainer({
  required Widget child,
  Color containerColor = ColorRes.containerKColor,
  double height = 60,
  double borderRadius = 10,
}) {
  return Container(
    height: height,
    width: double.infinity,
    decoration: BoxDecoration(
      color: containerColor,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: Center(child: child),
  );
}
