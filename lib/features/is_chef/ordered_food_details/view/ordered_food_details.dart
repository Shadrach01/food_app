import 'package:flutter/material.dart';
import 'package:food_app/features/is_chef/ordered_food_details/widgets/ordered_food_details_widgets.dart';

class OrderedFoodDetails extends StatelessWidget {
  const OrderedFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OrderedFoodDetailsWidgets(),
    );
  }
}
