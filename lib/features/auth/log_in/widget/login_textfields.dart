import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_textfields.dart';

class LogInTextfields extends StatefulWidget {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  final void Function(String)? onEmailChanged;
  final void Function(String)? onPasswordChanged;

  const LogInTextfields({
    super.key,
    this.emailController,
    this.passwordController,
    this.onEmailChanged,
    this.onPasswordChanged,
  });

  @override
  State<LogInTextfields> createState() => _LogInTextfieldsState();
}

class _LogInTextfieldsState extends State<LogInTextfields> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "EMAIL",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 5),
        AppTextfield(
          controller: widget.emailController,
          hintText: "example@gmail.com",
          keyboardType: TextInputType.emailAddress,
          onChanged: widget.onEmailChanged,
        ),
        const SizedBox(height: 30),
        const Text(
          "PASSWORD",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 5),
        AppTextfield(
          controller: widget.passwordController,
          hintText: "Password here",
          onChanged: widget.onPasswordChanged,
          keyboardType: TextInputType.visiblePassword,
          surffixIcon: Icons.visibility_rounded,
          obScureText: _obscureText,
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
