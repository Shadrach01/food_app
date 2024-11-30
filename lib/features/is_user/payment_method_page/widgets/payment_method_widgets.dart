import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/routes/app_route_names.dart';
import 'package:food_app/features/is_user/payment_method_page/widgets/pay_and_confirm.dart';
import 'package:go_router/go_router.dart';

import 'add_new_card_button.dart';
import 'different_payment_cards.dart';

class PaymentMethodWidgets extends StatelessWidget {
  const PaymentMethodWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            // Page App Bar
            const CustomAppBar(
              title: Text(
                "Payment",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const DifferentPaymentCards(),
            const SizedBox(height: 20),
            addNewCardButton(
                onTap: () =>
                    context.push(AppRouteNames.addCardRoute)),
            const SizedBox(height: 90),
            const PayAndConfirm(),
          ],
        ),
      ),
    );
  }
}
