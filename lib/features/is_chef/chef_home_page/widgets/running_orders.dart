import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_chef/chef_home_page/widgets/orders_tile.dart';

class RunningOrders extends StatefulWidget {
  const RunningOrders({super.key});

  @override
  State<RunningOrders> createState() => _RunningOrdersState();
}

class _RunningOrdersState extends State<RunningOrders> {
  late DraggableScrollableController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DraggableScrollableController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _controller,
      initialChildSize: 1,
      maxChildSize: 1,
      builder: (context, controller) {
        return Container(
          padding: const EdgeInsets.only(
            left: 30,
            top: 10,
            right: 30,
          ),
          decoration: const BoxDecoration(
            color: ColorRes.appKWhite,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(25),
              right: Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 6,
                  width: 70,
                  decoration: BoxDecoration(
                    color: ColorRes.appKLightGrey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "20 Running Orders",
                style: TextStyle(
                  fontSize: 25,
                  color: ColorRes.appKDarkBlack,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: OrdersTile(),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
