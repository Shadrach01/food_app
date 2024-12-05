import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/details_tile.dart';
import 'package:food_app/core/utils/color_res.dart';

class WithdrawalHistoryTile extends StatelessWidget {
  const WithdrawalHistoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorRes.appKLightGrey.withOpacity(.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DetailsTile(
            leadIcon: Icon(
              Icons.receipt,
              color: ColorRes.containerKColor,
            ),
            title: "Withdrawal History",
          ),
          SizedBox(height: 8),
          DetailsTile(
            leadIcon: Icon(
              Icons.receipt_long,
              color: Colors.blue,
            ),
            title: "Number of Orders",
            trailingIcon: Text(
              "29K",
              style: TextStyle(
                fontSize: 20,
                color: ColorRes.appKGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
