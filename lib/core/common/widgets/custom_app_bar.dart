import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leadIcon;
  final Widget? title;
  final Widget? trailingIcon;

  final void Function()? onLeadTapped;
  final void Function()? onTitleTapped;

  const CustomAppBar({
    super.key,
    this.leadIcon,
    this.title,
    this.trailingIcon,
    this.onLeadTapped,
    this.onTitleTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: onLeadTapped,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: ColorRes.appKGrey.withOpacity(.23),
                  shape: BoxShape.circle,
                ),
                child: leadIcon,
              ),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: onTitleTapped,
              child: Container(
                child: title,
              ),
            )
          ],
        ),
        Container(
          child: trailingIcon,
        )
      ],
    );
  }
}
