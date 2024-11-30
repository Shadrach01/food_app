import 'package:flutter/material.dart';
import 'package:food_app/features/is_user/home_page/widgets/home_page_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: HomePageWidgets(),
      ),
    );
  }
}
