import 'package:flutter/material.dart';
import 'package:food_app/core/common/app_snackbar.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/routes/app_route_names.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:go_router/go_router.dart';

class ChefOrUserWidgets extends StatefulWidget {
  const ChefOrUserWidgets({super.key});

  @override
  State<ChefOrUserWidgets> createState() => _ChefOrUserWidgetsState();
}

class _ChefOrUserWidgetsState extends State<ChefOrUserWidgets> {
  bool? isChef;

  @override
  Widget build(BuildContext context) {
    // Watch the provider to get the current value
    // final isChef = ref.watch(isChefProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImageRes.onboarding_3),
          const SizedBox(height: 30),
          const Text(
            "Are you a chef?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          RadioListTile(
            title: const Text(
              "Yes I am",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorRes.appKGrey,
              ),
            ),
            value: true,
            groupValue: isChef,
            activeColor: ColorRes.containerKColor,
            onChanged: (value) {
              setState(() {
                isChef = value;
              });
            },
          ),
          RadioListTile(
            title: const Text(
              "No! I'm just here to eat",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorRes.appKGrey,
              ),
            ),
            value: false,
            groupValue: isChef,
            activeColor: ColorRes.containerKColor,
            onChanged: (value) {
              setState(() {
                isChef = value;
              });
            },
          ),
          const SizedBox(height: 100),
          GestureDetector(
            onTap: () {
              if (isChef == null) {
                AppSnackBar.show(context,
                    message: "No option selected");
              } else if (isChef == true) {
                context.go(AppRouteNames.chefSignUpRoute);
              } else {
                context.go(AppRouteNames.userSignupRoute);
              }
            },
            child: const AppContainer(
              child: Text(
                "Continue",
                style: TextStyle(
                  color: ColorRes.appKWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
