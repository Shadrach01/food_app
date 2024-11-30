import 'package:flutter/material.dart';
import 'package:food_app/features/is_user/payment_successful_page/widgets/payment_successful_widgets.dart';

class PaymentSuccessfulPage extends StatelessWidget {
  const PaymentSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PaymentSuccessfulWidgets(),
    );
  }
}
