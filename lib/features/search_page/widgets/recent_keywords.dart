import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';

class RecentKeywords extends StatelessWidget {
  const RecentKeywords({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recent Keywords",
          style: TextStyle(
            fontSize: 20,
            color: ColorRes.appKBlack,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 55,
          child: ListView(

            scrollDirection: Axis.horizontal,
            children: [
              categoriesContainer(
                
                text: "Burger",
              ),
              categoriesContainer(text: "Hot Dog"),
              categoriesContainer(text: "Burger"),
              categoriesContainer(text: "Pizza"),
              categoriesContainer(text: "Sharwarma"),
            ],
          ),
        ),
      ],
    );
  }

  Widget categoriesContainer({
 
    String text = '',
  }) {
    return IntrinsicWidth(
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
   
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: ColorRes.appKGrey.withOpacity(.2),
            width: 2,
          ),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}
