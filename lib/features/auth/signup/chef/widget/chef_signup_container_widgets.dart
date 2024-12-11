import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/auth/signup/chef/widget/chef_signup_textfields.dart';
import 'package:food_app/features/auth/signup/user/widget/user_signup_button.dart';

class ChefSignUpContainerWidgets extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController restaurantNameController;
  final TextEditingController restaurantAddressController;
  final TextEditingController pwController;
  final TextEditingController rPwController;

  final void Function(String)? onNameChanged;
  final void Function(String)? onEmailChanged;
  final void Function(String)? onRestaurantNameChanged;
  final void Function(String)? onRestaurantAddressChanged;
  final void Function(String)? onPasswordChanged;
  final void Function(String)? onConfirmPasswordChanged;
  final void Function()? onSignUp;

  final bool isLoading;

  const ChefSignUpContainerWidgets({
    super.key,
    required this.onSignUp,
    required this.nameController,
    required this.emailController,
    required this.restaurantNameController,
    required this.restaurantAddressController,
    required this.pwController,
    required this.rPwController,
    required this.isLoading,
    this.onNameChanged,
    this.onEmailChanged,
    this.onRestaurantNameChanged,
    this.onRestaurantAddressChanged,
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
        padding: const EdgeInsets.only(
          right: 25,
          left: 25,
          bottom: 25,
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            ChefSignUpTextfields(
              nameController: nameController,
              emailController: emailController,
              restaurantNameController: restaurantNameController,
              restaurantAddressController:
                  restaurantAddressController,
              pwController: pwController,
              rPwController: rPwController,
              onNameChanged: onNameChanged,
              onEmailChanged: onEmailChanged,
              onRestaurantNameChanged: onRestaurantNameChanged,
              onRestaurantAddressChanged: onRestaurantAddressChanged,
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
