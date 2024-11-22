import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';

class AppTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final void Function(String)? onChanged;
  final bool obScureText;
  final String? Function(String?)? validator;
  final IconData? preffixIcon;
  final IconData? surffixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool readOnly;
  const AppTextfield({
    super.key,
    this.controller,
    this.hintText = '',
    this.onChanged,
    this.obScureText = false,
    this.validator,
    this.preffixIcon,
    this.surffixIcon,
    this.textInputAction,
    this.keyboardType,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return appContainer(
      containerColor: ColorRes.appKLightGrey,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obScureText,
        validator: validator,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: preffixIcon != null ? Icon(preffixIcon) : null,
            suffixIcon: surffixIcon != null ? Icon(surffixIcon) : null,
            suffixIconColor: ColorRes.appKGrey,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20)),
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        readOnly: readOnly,
      ),
    );
  }
}
