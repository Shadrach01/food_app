import 'package:flutter/material.dart';

import '../widgets/food_details_widgets.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FoodDetailsWidgets(),
    );
  }
}
