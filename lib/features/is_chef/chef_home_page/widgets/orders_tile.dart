import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';

class OrdersTile extends StatelessWidget {
  const OrdersTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            color: ColorRes.appKGrey,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "#Breakfast",
                style: TextStyle(
                  fontSize: 18,
                  color: ColorRes.containerKColor,
                ),
              ),
              const Text(
                "Chicken Thai Biriyani",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorRes.appKDarkBlack,
                ),
              ),
              const Text(
                "ID: 32053",
                style: TextStyle(
                  fontSize: 15,
                  color: ColorRes.appKGrey,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    "\$60",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ColorRes.appKDarkBlack,
                    ),
                  ),
                  const SizedBox(width: 30),
                  const Expanded(
                    child: AppContainer(
                      height: 45,
                      child: Text(
                        "Done",
                        style: TextStyle(
                          color: ColorRes.appKWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppContainer(
                      containerColor: ColorRes.appKTransparent,
                      border: Border.all(
                        color: ColorRes.containerKColor,
                        width: 2,
                      ),
                      height: 45,
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: ColorRes.containerKColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
