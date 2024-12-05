import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';

class UploadFoodImageWidgets extends StatelessWidget {
  const UploadFoodImageWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "UPLOAD PHOTO / VIDEO",
          style: TextStyle(
            fontSize: 16,
            color: ColorRes.appKDarkBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 110,
                width: 120,
                decoration: BoxDecoration(
                  color: ColorRes.appKGrey,
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
              ),
              imageSelected(),
              imageSelected(),
              imageSelected(),
            ],
          ),
        )
      ],
    );
  }

  Widget imageSelected() {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: ColorRes.appKLightGrey.withOpacity(.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: ColorRes.appKGrey),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_upload,
            color: ColorRes.appKGrey,
          ),
          Text(
            "Add",
            style: TextStyle(
              color: ColorRes.appKGrey,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
