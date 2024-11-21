import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';

class EditCartWidgets extends StatelessWidget {
  const EditCartWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(),
        ],
      ),
    );
  }
}
