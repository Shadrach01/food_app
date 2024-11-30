import 'package:flutter/material.dart';
import 'package:food_app/features/is_user/add_card/widget/add_card_widgets.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddCardWidgets(),
    );
  }
}
