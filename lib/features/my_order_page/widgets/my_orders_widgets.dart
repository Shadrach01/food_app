import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/my_order_page/widgets/tabs/history_tab.dart';
import 'package:food_app/features/my_order_page/widgets/tabs/ongoing_tab.dart';

class MyOrdersWidgets extends StatelessWidget {
  const MyOrdersWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          children: [
            CustomAppBar(
              title: const Text(
                "My Orders",
                style: TextStyle(fontSize: 20),
              ),
              trailingIcon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorRes.appKGrey.withOpacity(.2),
                ),
                child: const Center(
                  child: Icon(
                    Icons.more_horiz,
                    color: ColorRes.appKDarkBlack,
                    size: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const DefaultTabController(
              length: 2,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      padding: EdgeInsets.only(bottom: 30),
                      indicatorColor: ColorRes.containerKColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding:
                          EdgeInsets.symmetric(horizontal: 20),
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: ColorRes.containerKColor,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: TextStyle(
                        color: ColorRes.appKGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      tabs: [
                        Tab(
                          text: "Ongoing",
                        ),
                        Tab(
                          text: "History",
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          OngoingTab(),
                          HistoryTab(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
