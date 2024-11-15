import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_textfields.dart';

class SignUpTextfields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController pwController;
  final TextEditingController rPwController;
  const SignUpTextfields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.pwController,
    required this.rPwController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("NAME"),
        const SizedBox(height: 5),
        AppTextfield(
          controller: nameController,
          hintText: "John Doe",
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 30),
        const Text("EMAIL"),
        const SizedBox(height: 5),
        AppTextfield(
          controller: emailController,
          hintText: "example@gmail.com",
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 30),
        const Text("PASSWORD"),
        const SizedBox(height: 5),
        AppTextfield(
          controller: pwController,
          hintText: "Password here",
          keyboardType: TextInputType.visiblePassword,
          surffixIcon: Icons.visibility_rounded,
        ),
        const SizedBox(height: 30),
        const Text("RE-TYPE PASSWORD"),
        const SizedBox(height: 5),
        AppTextfield(
          controller: rPwController,
          hintText: "Re-Type Password here",
          keyboardType: TextInputType.visiblePassword,
          surffixIcon: Icons.visibility_rounded,
        ),
      ],
    );
  }
}
