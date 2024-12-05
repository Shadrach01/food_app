import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_chef/chef_home_page/widgets/order_requests.dart';
import 'package:food_app/features/is_chef/chef_home_page/widgets/running_orders.dart';

class OrdersContainers extends StatelessWidget {
  const OrdersContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: orderContainer(
            orderNumber: "20",
            text: 'RUNNING ORDERS',
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const RunningOrders(),
              );
            },
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: orderContainer(
            orderNumber: '05',
            text: 'ORDER REQUEST',
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const OrderRequests(),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget orderContainer({
    String orderNumber = '',
    String text = '',
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AppContainer(
        height: 120,
        containerColor: ColorRes.appKWhite,
        borderRadius: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              orderNumber,
              style: const TextStyle(
                color: ColorRes.appKBlack,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: ColorRes.appKGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
