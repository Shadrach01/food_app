import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/features/is_chef/add_new_food/controller/add_new_food_controller.dart';
import 'package:food_app/features/is_chef/add_new_food/provider/add_new_food_notifier.dart';
import 'package:food_app/features/is_chef/add_new_food/provider/add_new_food_state.dart';

class UploadFoodImageWidgets extends ConsumerStatefulWidget {
  const UploadFoodImageWidgets({
    super.key,
  });

  @override
  ConsumerState<UploadFoodImageWidgets> createState() =>
      _UploadFoodImageWidgetsState();
}

class _UploadFoodImageWidgetsState
    extends ConsumerState<UploadFoodImageWidgets> {
  late AddNewFoodController? _controller;

  @override
  void didChangeDependencies() {
    _controller = AddNewFoodController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final image = _controller?.imageFile?.path;
    final addNewFoodState =
        ref.watch(addNewFoodNotifierProvider) as AddNewFoodState;

    final foodImages = addNewFoodState.foodImages;
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
            children: List.generate(5, (index) {
              // Display selected images
              return imageSelected(
                  index: index,
                  selectedImage: index < foodImages.length
                      ? foodImages[index]
                      : null,
                  onTap: (index) {
                    // Optionally allow replacing or viewing the selected image
                    _controller?.pickImage(ref, index);
                  });
            }),
          ),
        )
      ],
    );
  }

  Widget imageSelected({
    required int index,
    String? selectedImage,
    required void Function(int index) onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: selectedImage == null
              ? ColorRes.appKLightGrey.withOpacity(.2)
              : ColorRes.appKTransparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorRes.appKGrey),
          image: selectedImage != null
              ? DecorationImage(
                  image: FileImage(
                    // Display the selected image
                    File(selectedImage),
                  ),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: selectedImage == null
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_upload, color: ColorRes.appKGrey),
                  Text(
                    "Add",
                    style: TextStyle(
                      color: ColorRes.appKGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            : null,
      ),
    );
  }
}
