import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_textfields.dart';

class ChefSignUpTextfields extends StatefulWidget {
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? restaurantNameController;
  final TextEditingController? restaurantAddressController;
  final TextEditingController? pwController;
  final TextEditingController? rPwController;
  final void Function(String)? onNameChanged;
  final void Function(String)? onEmailChanged;
  final void Function(String)? onRestaurantNameChanged;
  final void Function(String)? onRestaurantAddressChanged;
  final void Function(String)? onPasswordChanged;
  final void Function(String)? onConfirmPasswordChanged;

  const ChefSignUpTextfields({
    super.key,
    this.nameController,
    this.emailController,
    this.restaurantNameController,
    this.restaurantAddressController,
    this.pwController,
    this.rPwController,
    this.onNameChanged,
    this.onEmailChanged,
    this.onRestaurantNameChanged,
    this.onRestaurantAddressChanged,
    this.onPasswordChanged,
    this.onConfirmPasswordChanged,
  });

  @override
  State<ChefSignUpTextfields> createState() =>
      _SignUpTextfieldsState();
}

class _SignUpTextfieldsState extends State<ChefSignUpTextfields> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("NAME"),
        const SizedBox(height: 5),
        AppTextfield(
          controller: widget.nameController,
          hintText: "John Doe",
          keyboardType: TextInputType.name,
          onChanged: widget.onNameChanged,
        ),
        const SizedBox(height: 30),
        const Text("EMAIL"),
        const SizedBox(height: 5),
        AppTextfield(
          controller: widget.emailController,
          hintText: "example@gmail.com",
          keyboardType: TextInputType.emailAddress,
          onChanged: widget.onEmailChanged,
        ),
        const SizedBox(height: 30),
        const Text("RESTAURANT NAME"),
        const SizedBox(height: 5),
        AppTextfield(
          controller: widget.restaurantNameController,
          hintText: "The Good Man Kitchen",
          keyboardType: TextInputType.text,
          onChanged: widget.onRestaurantNameChanged,
        ),
        const SizedBox(height: 30),
        const Text("RESTAURANT ADDRESS"),
        const SizedBox(height: 5),
        AppTextfield(
          controller: widget.restaurantAddressController,
          hintText: "23, Oxford Street",
          keyboardType: TextInputType.text,
          onChanged: widget.onRestaurantAddressChanged,
        ),
        const SizedBox(height: 30),
        const Text("PASSWORD"),
        const SizedBox(height: 5),
        AppTextfield(
          controller: widget.pwController,
          hintText: "Password here",
          keyboardType: TextInputType.visiblePassword,
          surffixIcon: Icons.visibility_rounded,
          onChanged: widget.onPasswordChanged,
          onSuffixIconPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        const SizedBox(height: 30),
        const Text("RE-TYPE PASSWORD"),
        const SizedBox(height: 5),
        AppTextfield(
          controller: widget.rPwController,
          hintText: "Re-Type Password here",
          keyboardType: TextInputType.visiblePassword,
          surffixIcon: Icons.visibility_rounded,
          onChanged: widget.onConfirmPasswordChanged,
          onSuffixIconPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ],
    );
  }
}
