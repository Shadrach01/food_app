import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';

class PayAndConfirm extends StatelessWidget {
  const PayAndConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Text(
              "TOTAL: ",
              style: TextStyle(
                color: ColorRes.appKGrey,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 20),
            Text(
              "\$96 ",
              style: TextStyle(
                color: ColorRes.appKDarkBlack,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 50),
        AppContainer(
            child: Text(
          "PAY & CONFIRM",
          style: TextStyle(
            fontSize: 15,
            color: ColorRes.appKWhite,
            fontWeight: FontWeight.bold,
          ),
        ))
      ],
    );
  }
}
