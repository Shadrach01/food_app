import 'package:flutter/material.dart';
import 'package:food_app/features/menu_page/widgets/menu_page_widgets.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MenuPageWidgets(),
    );
  }
}
