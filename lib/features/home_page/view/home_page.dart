import 'package:flutter/material.dart';
import 'package:food_app/features/home_page/widgets/home_page_widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final searchController = TextEditingController();

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: HomePageWidgets(
          searchBarController: searchController,
          focusNode: focusNode,
        ),
      ),
    );
  }
}
