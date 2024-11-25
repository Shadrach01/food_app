import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_textfields.dart';
import 'package:food_app/core/utils/color_res.dart';

class EditProfileTextFields extends StatelessWidget {
  const EditProfileTextFields({
    super.key,
    this.text = '',
    this.obscureText = false,
  });

  final String text;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            color: ColorRes.appKGrey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        AppTextfield(
          obScureText: obscureText,
        ),
      ],
    );
  }
}
