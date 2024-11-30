import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';

import '../widgets/chef_or_user_widgets.dart';

class ChefOrUser extends StatelessWidget {
  const ChefOrUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorRes.appKWhite,
      body: ChefOrUserWidgets(),
    );
  }
}
