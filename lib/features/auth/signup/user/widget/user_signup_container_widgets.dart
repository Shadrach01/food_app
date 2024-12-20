import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/auth/signup/user/widget/user_signup_button.dart';
import 'package:food_app/features/auth/signup/user/widget/user_signup_textfields.dart';

class SignUpContainerWidgets extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController pwController;
  final TextEditingController rPwController;

  final void Function(String)? onNameChanged;
  final void Function(String)? onEmailChanged;
  final void Function(String)? onPasswordChanged;
  final void Function(String)? onConfirmPasswordChanged;
  final void Function()? onSignUp;

  final bool isLoading;

  const SignUpContainerWidgets({
    super.key,
    required this.onSignUp,
    required this.nameController,
    required this.emailController,
    required this.pwController,
    required this.rPwController,
    required this.isLoading,
    this.onNameChanged,
    this.onEmailChanged,
    this.onPasswordChanged,
    this.onConfirmPasswordChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 1,
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
            SignUpTextfields(
              nameController: nameController,
              emailController: emailController,
              pwController: pwController,
              rPwController: rPwController,
              onNameChanged: onNameChanged,
              onEmailChanged: onEmailChanged,
              onPasswordChanged: onPasswordChanged,
              onConfirmPasswordChanged: onConfirmPasswordChanged,
            ),
            const SizedBox(height: 5),
            const SizedBox(height: 40),
            SignupButton(
              isLoading: isLoading,
              onSignUp: onSignUp,
            ),
          ],
        ),
      ),
    );
  }
}
