import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_textfields.dart';
import 'package:food_app/core/utils/color_res.dart';

class AddCardTextField extends StatelessWidget {
  final String text;
  final bool obscureText;

  const AddCardTextField({
    super.key,
    this.text = '',
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: ColorRes.appKGrey,
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
