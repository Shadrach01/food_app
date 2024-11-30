import 'package:flutter/material.dart';
import 'package:food_app/core/utils/image_res.dart';
import '../../../../core/utils/color_res.dart';

class NameEmailAndPhoneNumberContainer extends StatelessWidget {
  const NameEmailAndPhoneNumberContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorRes.appKLightGrey.withOpacity(.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          tile(
            leadIcon: Image.asset(
              ImageRes.user,
              color: ColorRes.containerKColor,
            ),
            titleText: "Full name",
            infoText: "Samuel Shadrach",
          ),
          const SizedBox(height: 8),
          tile(
            leadIcon: Icon(
              Icons.email_outlined,
              color: Colors.blue.shade800,
            ),
            titleText: "Email",
            infoText: "shab@gmail.com",
          ),
          const SizedBox(height: 8),
          tile(
            leadIcon: Image.asset(
              ImageRes.call,
              width: 20,
              height: 20,
              color: Colors.blue,
            ),
            titleText: "Phone Number",
            infoText: "08137063785",
          ),
        ],
      ),
    );
  }

  Widget tile({
    void Function()? onTap,
    String? titleText,
    String? infoText,
    Widget? leadIcon,
  }) {
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
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText!.toUpperCase(),
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            infoText!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
