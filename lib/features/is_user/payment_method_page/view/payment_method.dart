import 'package:flutter/material.dart';
import 'package:food_app/features/is_user/payment_method_page/widgets/payment_method_widgets.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PaymentMethodWidgets(),
    );
  }
}
