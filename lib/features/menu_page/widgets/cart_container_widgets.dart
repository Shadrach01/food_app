import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/features/menu_page/widgets/details_tile.dart';

class CartContainerWidgets extends StatelessWidget {
  const CartContainerWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorRes.appKLightGrey.withOpacity(.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const DetailsTile(
            leadIcon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.blue,
            ),
            title: "Cart",
          ),
          const SizedBox(height: 8),
          DetailsTile(
            leadIcon: Image.asset(
              ImageRes.heart,
              width: 20,
              height: 20,
            ),
            title: "Favorite",
          ),
          const SizedBox(height: 8),
          DetailsTile(
            leadIcon: Image.asset(
              ImageRes.bell,
              width: 20,
              height: 20,
              color: ColorRes.containerKColor,
            ),
            title: "Notifications",
          ),
          const SizedBox(height: 8),
          DetailsTile(
            leadIcon: Image.asset(
              ImageRes.creditCard,
              width: 20,
              height: 20,
              color: Colors.blue,
            ),
            title: "Payment Method",
          ),
        ],
      ),
    );
  }
}
