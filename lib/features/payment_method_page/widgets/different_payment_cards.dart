import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/core/utils/text_res.dart';

/// Widget for different means of payment, cash or card etc

class DifferentPaymentCards extends StatelessWidget {
  const DifferentPaymentCards({super.key});

  /// Widget for different means of payment, cash or card etc
  Widget meansOfPayment(
    String text,
    String image, {
    bool selected = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        selected
            ? Badge(
                label: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: ColorRes.containerKColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorRes.appKWhite,
                    ),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: ColorRes.appKWhite,
                    size: 20,
                  ),
                ),
                backgroundColor: ColorRes.appKTransparent,
                offset: const Offset(-30, 0),
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 20,
                    bottom: 5,
                  ),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: ColorRes.appKWhite,
                    border: Border.all(
                      color: ColorRes.containerKColor,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(image),
                  ),
                ),
              )
            : Container(
                margin: const EdgeInsets.only(
                  right: 20,
                  bottom: 5,
                ),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: ColorRes.appKGrey.withOpacity(.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(image),
                ),
              ),
        Text(
          text,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              meansOfPayment("Cash", ImageRes.cashLogo),
              meansOfPayment(
                "Visa",
                ImageRes.visaLogo,
                selected: true,
              ),
              meansOfPayment(
                "MasterCard",
                ImageRes.masterCard,
              ),
              meansOfPayment("Paypal", ImageRes.paypalLogo),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15,
          ),
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorRes.appKGrey.withOpacity(.1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                ImageRes.emptyMasterCard,
                width: 200,
                height: 100,
              ),
              const Text(
                TextRes.noCard,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                TextRes.addCard,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
