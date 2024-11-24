import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/core/utils/text_res.dart';
import 'package:go_router/go_router.dart';

class PaymentSuccessfulWidgets extends StatelessWidget {
  const PaymentSuccessfulWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      ImageRes.paymentSuccessful,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Congratulations!",
                    style: TextStyle(
                      color: ColorRes.appKDarkBlack,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: Text(
                      TextRes.paymentSuccessful,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorRes.appKGrey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => context.push('/trackOrder'),
              child: const AppContainer(
                child: Text(
                  "TRACK ORDER",
                  style: TextStyle(
                    color: ColorRes.appKWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
