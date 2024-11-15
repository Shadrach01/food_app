import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';

class AppSnackBar {
  static SnackBar createSnackBar({
    required String message,
  }) {
    return SnackBar(
      margin: const EdgeInsets.only(
        right: 10,
        left: 10,
        bottom: 100,
      ),
      content: Text(message),
      backgroundColor: ColorRes.containerKColor,
      behavior: SnackBarBehavior.floating,
    );
  }

  // Function to show the snackbar
  static void show(
    BuildContext context, {
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      createSnackBar(message: message),
    );
  }
}
