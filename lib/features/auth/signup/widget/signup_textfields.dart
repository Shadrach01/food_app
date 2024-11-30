import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_textfields.dart';

class SignUpTextfields extends StatefulWidget {
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? pwController;
  final TextEditingController? rPwController;
  final void Function(String)? onNameChanged;
  final void Function(String)? onEmailChanged;
  final void Function(String)? onPasswordChanged;
  final void Function(String)? onConfirmPasswordChanged;

  const SignUpTextfields({
    super.key,
    this.nameController,
    this.emailController,
    this.pwController,
    this.rPwController,
    this.onNameChanged,
    this.onEmailChanged,
    this.onPasswordChanged,
    this.onConfirmPasswordChanged,
  });

  @override
  State<SignUpTextfields> createState() => _SignUpTextfieldsState();
}

class _SignUpTextfieldsState extends State<SignUpTextfields> {
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
