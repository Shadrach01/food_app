import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/text_res.dart';

class SearchBarContainer extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onTap;
  const SearchBarContainer({
    super.key,
    this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return appContainer(
      containerColor: ColorRes.appKBlack.withOpacity(.1),
      child: SearchBar(
        controller: controller,
        backgroundColor: const WidgetStatePropertyAll(ColorRes.appKTransparent),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.only(left: 10),
        ),
        hintText: TextRes.searchRestaurants,
        elevation: const WidgetStatePropertyAll(0),
        leading: const Icon(CupertinoIcons.search),
        focusNode: FocusNode(),
        onTap: onTap,
      ),
    );
  }
}
