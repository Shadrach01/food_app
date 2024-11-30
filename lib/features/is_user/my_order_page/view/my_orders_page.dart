import 'package:flutter/material.dart';
import 'package:food_app/features/is_user/my_order_page/widgets/my_orders_widgets.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyOrdersWidgets(),
    );
  }
}
