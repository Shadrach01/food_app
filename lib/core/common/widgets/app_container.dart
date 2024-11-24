import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final Color containerColor;
  final double height;
  final double borderRadius;
  final Border? border;

  const AppContainer({
    super.key,
    required this.child,
    this.containerColor = ColorRes.containerKColor,
    this.height = 60,
    this.borderRadius = 10,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: containerColor,
        border: border,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(child: child),
    );
  }
}
