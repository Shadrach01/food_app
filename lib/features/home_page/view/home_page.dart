import 'package:flutter/material.dart';
import 'package:food_app/features/home_page/widgets/home_page_widgets.dart';
import 'package:food_app/features/home_page/widgets/search_widgets/on_search_activated.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: HomePageWidgets(),
      ),
    );
  }
}


class HomePageSearch extends StatelessWidget {
  const HomePageSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SearchPageWidgets(),
      ),
    );
  }
}
