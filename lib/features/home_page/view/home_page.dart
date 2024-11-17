import 'package:flutter/material.dart';
import 'package:food_app/features/home_page/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    /// Clear focus when returning to this page to
    /// to make sure the keyboard does not pop up automatically
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.unfocus();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    focusNode.dispose();
    super.dispose();
  }

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
