import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';

class SelectedFoodWidget extends StatelessWidget {
  final String text;

  const SelectedFoodWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    //Split the text into words
    final words = text.split(' ');
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 140,
            width: 100,
            decoration: BoxDecoration(
              color: ColorRes.appKGrey,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (words.length >= 2)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        words.take(2).join(' '), // Take the first two
                        style: const TextStyle(
                          color: ColorRes.appKWhite,
                          fontSize: 20,
                        ),
                      ),
                      if (words.length > 2)
                        Text(
                          words.skip(2).join(' '),
                          // Take the remaining words
                          style: const TextStyle(
                            color: ColorRes.appKWhite,
                            fontSize: 20,
                          ),
                        ),
                      if (words.length <= 2)
                        Text(
                          text,
                          // Display the entire text if fewer than 3 words
                          style: const TextStyle(
                            color: ColorRes.appKWhite,
                            fontSize: 20,
                          ),
                        ),
                    ],
                  ),
                const SizedBox(width: 20),
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    color: ColorRes.containerKColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    ImageRes.cross,
                    color: ColorRes.appKWhite,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "\$64",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorRes.appKWhite,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '14"',
                  style: TextStyle(
                    color: ColorRes.appKGrey,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 50),
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: ColorRes.appKWhite.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    ImageRes.minus,
                    color: ColorRes.appKWhite,
                    height: 20,
                    width: 20,
                  ),
                ),

                const SizedBox(width: 20),

                const Text(
                  "2",
                  style: TextStyle(
                    color: ColorRes.appKWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(width: 20),

                //Add to cart
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: ColorRes.appKWhite.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    ImageRes.plus,
                    color: ColorRes.appKWhite,
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
