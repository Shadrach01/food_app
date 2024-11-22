import 'package:flutter/material.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:go_router/go_router.dart';

import '../../utils/color_res.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leadIcon;
  final Widget? title;
  final Widget? trailingIcon;
  final double containerHeight;
  final double containerWidth;
  final Color? leadingContainerColor;

  final Color? leadIconColor;

  final void Function()? onLeadTapped;
  final void Function()? onTitleTapped;
  final void Function()? onTrailingTapped;

  const CustomAppBar({
    super.key,
    this.leadIcon,
    this.title,
    this.containerHeight = 50,
    this.containerWidth = 50,
    this.leadingContainerColor,
    this.leadIconColor,
    this.trailingIcon,
    this.onLeadTapped,
    this.onTitleTapped,
    this.onTrailingTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // APP BAR LEAD ICON
            GestureDetector(
              onTap: () => onLeadTapped ?? context.pop(),
              child: Container(
                height: containerHeight,
                width: containerWidth,
                decoration: BoxDecoration(
                  color: leadingContainerColor ??
                      ColorRes.appKGrey.withOpacity(.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: leadIcon ??
                      Image.asset(
                        ImageRes.icon,
                        color:
                            leadIconColor ?? ColorRes.appKDarkBlack,
                      ),
                ),
              ),
            ),
            const SizedBox(width: 15),

            // APP BAR TITLE
            GestureDetector(
              onTap: onTitleTapped,
              child: Container(
                child: title,
              ),
            )
          ],
        ),

        // APP BAR TRAILING WIDGET
        GestureDetector(
          onTap: onTrailingTapped,
          child: trailingIcon,
        )
      ],
    );
  }
}
