import 'package:flutter/material.dart';
import 'package:food_app/features/is_chef/add_new_food/widgets/add_new_food_widgets.dart';

class AddNewFoodPage extends StatelessWidget {
  const AddNewFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddNewFoodWidgets(),
    );
  }
}
