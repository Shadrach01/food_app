import 'package:flutter/material.dart';
import 'package:food_app/features/is_chef/chef_food_list/widgets/chef_food_list_widgets.dart';

class ChefFoodListPage extends StatelessWidget {
  const ChefFoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChefFoodListWidgets(),
    );
  }
}
