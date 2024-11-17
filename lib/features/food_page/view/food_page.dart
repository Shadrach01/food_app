import 'package:flutter/material.dart';
import 'package:food_app/features/food_page/widgets/food_page_widgets.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FoodPageWidgets(),
    );
  }
}
