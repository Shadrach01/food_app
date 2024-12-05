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
  final void Function()? onSuffixIconPressed;

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
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      containerColor: ColorRes.appKLightGrey.withOpacity(.4),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obScureText,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorRes.appKGrey.withOpacity(.5),
            fontSize: 15,
          ),
          border: InputBorder.none,
          isDense: true,
          prefixIcon: preffixIcon != null ? Icon(preffixIcon) : null,
          suffixIcon: surffixIcon != null
              ? IconButton(
                  icon: Icon(
                    surffixIcon,
                    color: ColorRes.appKGrey.withOpacity(.5),
                  ),
                  onPressed: onSuffixIconPressed,
                )
              : null,
          suffixIconColor: ColorRes.appKGrey,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        readOnly: readOnly,
      ),
    );
  }
}
