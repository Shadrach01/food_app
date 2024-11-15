import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_textfields.dart';

class LogInTextfields extends StatelessWidget {
  const LogInTextfields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("EMAIL"),
        SizedBox(height: 5),
        AppTextfield(
          hintText: "example@gmail.com",
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 30),
        Text("PASSWORD"),
        SizedBox(height: 5),
        AppTextfield(
          hintText: "Password here",
          keyboardType: TextInputType.visiblePassword,
          surffixIcon: Icons.visibility_rounded,
        ),
      ],
    );
  }
}
