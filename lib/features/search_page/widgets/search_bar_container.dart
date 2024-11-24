import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/text_res.dart';

class SearchBarContainer extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool enabled;
  final void Function()? onTap;

  const SearchBarContainer({
    super.key,
    this.controller,
    this.focusNode,
    this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      containerColor: ColorRes.appKBlack.withOpacity(.1),
      child: SearchBar(
        controller: controller,
        backgroundColor:
            const WidgetStatePropertyAll(ColorRes.appKTransparent),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.only(left: 10),
        ),
        hintText: TextRes.searchRestaurants,
        elevation: const WidgetStatePropertyAll(0),
        leading: const Icon(CupertinoIcons.search),
        focusNode: focusNode,
        onTap: onTap,
        enabled: enabled,
      ),
    );
  }
}
