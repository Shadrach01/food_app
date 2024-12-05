import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';

class ChefProfileAppBar extends StatelessWidget {
  const ChefProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: 330,
      borderRadius: 20,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const CustomAppBar(
                leadingContainerColor: ColorRes.appKWhite,
                title: Text(
                  "My Profile",
                  style: TextStyle(
                    color: ColorRes.appKWhite,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Available Balance",
                style: TextStyle(
                  color: ColorRes.appKWhite,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "\$500.00",
                style: TextStyle(
                  color: ColorRes.appKWhite,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorRes.appKWhite,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Center(
                  child: Text(
                    "Withdraw",
                    style: TextStyle(
                      color: ColorRes.appKWhite,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
