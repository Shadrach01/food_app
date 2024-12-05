import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_chef/chef_food_list/widgets/tabs/each_time_food_details.dart';

class LunchWidget extends StatelessWidget {
  const LunchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3, // Replace with your History list count
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: EachTimeFoodDetails(
            time: "Lunch",
          ),
        );
      },
    );
  }
}
