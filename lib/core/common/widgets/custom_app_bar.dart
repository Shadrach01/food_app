import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leadIcon;
  final Widget? title;
  final Widget? trailingIcon;
  final double containerHeight;
  final double containerWidth;
  final Color? leadingContainerColor;
  final Color? trailingContainerColor;

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
    this.trailingContainerColor,
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
              onTap: onLeadTapped,
              child: Container(
                height: containerHeight,
                width: containerWidth,
                decoration: BoxDecoration(
                  color: leadingContainerColor,
                  shape: BoxShape.circle,
                ),
                child: Center(child: leadIcon),
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
          child: Container(
            height: containerHeight,
            width: containerWidth,
            decoration: BoxDecoration(
              color: trailingContainerColor,
              shape: BoxShape.circle,
            ),
            child: trailingIcon,
          ),
        )
      ],
    );
  }
}
