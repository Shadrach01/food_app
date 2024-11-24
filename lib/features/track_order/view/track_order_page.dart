import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/track_order/widgets/track_order_widgets.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.appKLightGrey,
      body: const TrackOrderWidgets(),
    );
  }
}
