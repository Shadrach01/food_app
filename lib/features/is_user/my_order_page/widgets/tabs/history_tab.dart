import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3, // Replace with your History list count
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: _historyFoodDetails(),
        );
      },
    );
  }

  Widget _historyFoodDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Food",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              "Completed",
              style: TextStyle(
                color: Colors.green.shade400,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Divider(thickness: 1),
        const SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: ColorRes.appKLightGrey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Utora Coffee House",
                  style: TextStyle(
                    color: ColorRes.appKDarkBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "\$35.25",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: ColorRes.appKDarkBlack,
                      ),
                    ),
                    SizedBox(width: 15),
                    SizedBox(
                      height: 20,
                      child: VerticalDivider(
                        color: ColorRes.appKGrey,
                        width: 4,
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "03 Items",
                      style: TextStyle(
                        fontSize: 15,
                        color: ColorRes.appKGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buttonRow(
          onTrackOrderTapped: () {},
          onCancelTapped: () {},
        ),
      ],
    );
  }

  // Row buttons
  Widget _buttonRow({
    void Function()? onTrackOrderTapped,
    void Function()? onCancelTapped,
  }) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTrackOrderTapped,
            child: const AppContainer(
              height: 50,
              child: Text(
                "Track Order",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorRes.appKWhite,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          child: GestureDetector(
            onTap: onCancelTapped,
            child: AppContainer(
              height: 50,
              containerColor: ColorRes.appKTransparent,
              border: Border.all(
                color: ColorRes.containerKColor,
                width: 2,
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorRes.containerKColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
