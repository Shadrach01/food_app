import 'package:flutter/material.dart';
import 'package:food_app/features/is_chef/chef_profile/widgets/chef_profile_widgets.dart';

class ChefProfilePage extends StatelessWidget {
  const ChefProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChefProfileWidgets(),
    );
  }
}
