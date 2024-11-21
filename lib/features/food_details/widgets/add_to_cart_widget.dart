import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:go_router/go_router.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorRes.appKLightGrey.withOpacity(.8),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "\$32",
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                height: 55,
                width: 140,
                decoration: BoxDecoration(
                  color: ColorRes.appKDarkBlack,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Remove from cart
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: ColorRes.appKWhite.withOpacity(.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: ColorRes.appKWhite,
                        size: 20,
                      ),
                    ),

                    const Text(
                      "2",
                      style: TextStyle(
                        color: ColorRes.appKWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    //Add to cart
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: ColorRes.appKWhite.withOpacity(.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: ColorRes.appKWhite,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          addToCartButton(
            onTap: () => context.push('/editCart'),
          ),
        ],
      ),
    );
  }

  // Add to cart button
  Widget addToCartButton({void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: appContainer(
        child: const Text(
          "ADD TO CART",
          style: TextStyle(
            color: ColorRes.appKWhite,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
