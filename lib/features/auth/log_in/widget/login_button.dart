import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';

class LoginButton extends StatelessWidget {
  final void Function()? onTap;
  final bool isLoading;

  const LoginButton({
    super.key,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppContainer(
        child: isLoading
            ? const CircularProgressIndicator(
                color: ColorRes.appKWhite,
                strokeWidth: 5,
              )
            : const Text(
                "LOG IN",
                style: TextStyle(
                  color: ColorRes.appKWhite,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
