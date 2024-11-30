import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';

class DetailsTile extends StatelessWidget {
  final String title;
  final Widget? leadIcon;
  final void Function()? onTap;

  const DetailsTile({
    super.key,
    this.title = '',
    this.leadIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        height: 45,
        width: 45,
        decoration: const BoxDecoration(
          color: ColorRes.appKWhite,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: leadIcon,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 19,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 17,
      ),
    );
  }
}
