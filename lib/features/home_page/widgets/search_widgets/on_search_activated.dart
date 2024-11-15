import 'package:flutter/cupertino.dart';
import 'package:food_app/features/home_page/widgets/home_page_app_bar.dart';
import 'package:food_app/features/home_page/widgets/search_widgets/search_bar_container.dart';

/// Screen for when the search bar is active
class SearchPageWidgets extends StatelessWidget {
  final TextEditingController? controller;
  const SearchPageWidgets({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const HomePageAppBar(),
          const SizedBox(height: 35),
          SearchBarContainer(
            controller: controller,
          ),
          const SizedBox(height: 30),
          const Text("Recent Keywords"),
        ],
      ),
    );
  }
}
