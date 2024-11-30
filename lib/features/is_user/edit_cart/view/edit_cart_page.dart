import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';

import '../widgets/edit_cart_widgets.dart';

class EditCartPage extends StatelessWidget {
  const EditCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorRes.appKDarkBlack,
      body: EditCartWidgets(),
    );
  }
}
