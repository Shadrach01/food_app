import 'package:flutter/material.dart';
import 'package:food_app/core/routes/app_route_names.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/core/utils/text_res.dart';
import 'package:food_app/features/auth/log_in/widget/login_button.dart';
import 'package:food_app/features/auth/log_in/widget/login_textfields.dart';
import 'package:food_app/features/auth/log_in/widget/other_login_means_widgets.dart';
import 'package:go_router/go_router.dart';

class LoginContainerWidgets extends StatefulWidget {
  final void Function() onTap;
  final bool isLoading;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final void Function(String)? onEmailChanged;
  final void Function(String)? onPasswordChanged;

  const LoginContainerWidgets({
    super.key,
    required this.onTap,
    required this.isLoading,
    this.emailController,
    this.passwordController,
    this.onEmailChanged,
    this.onPasswordChanged,
  });

  @override
  State<LoginContainerWidgets> createState() =>
      _LoginContainerWidgetsState();
}

class _LoginContainerWidgetsState
    extends State<LoginContainerWidgets> {
  bool _value = false;

  Widget rememberMe() {
    return Row(
      children: [
        Checkbox(
          value: _value,
          onChanged: (newValue) {
            _value = newValue!;
            setState(() {});
          },
          side: const BorderSide(
            color: ColorRes.appKGrey,
          ),
        ),
        const Text(
          "Remember Me",
          style: TextStyle(
            color: ColorRes.appKGrey,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      decoration: const BoxDecoration(
        color: ColorRes.appKWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            LogInTextfields(
              emailController: widget.emailController,
              passwordController: widget.passwordController,
              onEmailChanged: widget.onEmailChanged,
              onPasswordChanged: widget.onPasswordChanged,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                rememberMe(),
                const Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: ColorRes.containerKColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            LoginButton(
              isLoading: widget.isLoading,
              onTap: widget.onTap,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  TextRes.noAccount,
                  style: TextStyle(
                    color: ColorRes.appKGrey,
                    fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      context.push(AppRouteNames.confirmChefRoute),
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(
                      color: ColorRes.containerKColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Text(
              "Or",
              style: TextStyle(
                fontSize: 20,
                color: ColorRes.appKGrey,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtherLoginMeansWidgets(
                  imagePath: ImageRes.facebookLogo,
                ),
                OtherLoginMeansWidgets(
                  imagePath: ImageRes.twitterLogo,
                ),
                OtherLoginMeansWidgets(
                  imagePath: ImageRes.appleLogo,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
