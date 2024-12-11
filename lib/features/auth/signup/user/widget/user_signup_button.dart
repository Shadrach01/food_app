import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';

class SignupButton extends StatelessWidget {
  final void Function()? onSignUp;
  final bool isLoading;

  const SignupButton({
    super.key,
    required this.onSignUp,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSignUp,
      child: AppContainer(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorRes.appKWhite,
                ),
              )
            : const Text(
                "SIGN UP",
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
