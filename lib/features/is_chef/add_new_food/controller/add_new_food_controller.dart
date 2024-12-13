import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/app_snackbar.dart';
import 'package:food_app/core/global_loader/global_loader.dart';
import 'package:food_app/core/models/food_model.dart';
import 'package:food_app/features/is_chef/add_new_food/repo/add_new_food_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_app/features/is_chef/add_new_food/provider/add_new_food_notifier.dart';

class AddNewFoodController {
  AddNewFoodController();

  TextEditingController foodNameController = TextEditingController();
  TextEditingController foodPriceController = TextEditingController();
  TextEditingController foodDetailsController =
      TextEditingController();

  // Selected food ingredients
  final List<String> selectedItems = [];

  // Pick image(s) and save it
  Future pickImage(WidgetRef ref, int index) async {
    // Logic to pick an image
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      ref
          .read(addNewFoodNotifierProvider.notifier)
          .updateImageAtIndex(
            index,
            pickedImage.path,
          );
    }
  }

  // Logic to select Pick up or Delivery
  void updatePickUpOrDelivery(WidgetRef ref, String option) {
    ref
        .read(addNewFoodNotifierProvider.notifier)
        .onPickUpOrDeliverySelected(option);
  }

  // Function to add or remove items from selectedItems list
  void updateSelectedItems(
    String ingredient,
    WidgetRef ref,
  ) {
    if (selectedItems.contains(ingredient)) {
      // If already selected
      selectedItems.remove(ingredient);
    } else {
      // If not selected, add it
      selectedItems.add(ingredient);
    }

    ref
        .read(addNewFoodNotifierProvider.notifier)
        .onIngredientsSelected(selectedItems);
  }

  Future<void> addFoodToDatabase(
      BuildContext context, WidgetRef ref) async {
    // Get the current state
    var state = ref.read(addNewFoodNotifierProvider);

    String foodName = state.foodName;
    String foodPrice = state.price;
    String foodDetails = state.foodDetails;
    String pickupOrDelivery = state.pickupOrDelivery;
    List<String> foodImages = state.foodImages;
    List<String> ingredients = state.ingredients;

    foodNameController.text = foodName;
    foodPriceController.text = foodPrice;
    foodDetailsController.text = foodDetails;

    // Input validation
    if (state.foodName.isEmpty || foodName.isEmpty) {
      AppSnackBar.show(context, message: "Input the food name");
      return;
    }
    if (foodImages.isEmpty) {
      AppSnackBar.show(context,
          message: "Select at least one picture");
      return;
    }
    if (state.price.isEmpty || foodPrice.isEmpty) {
      AppSnackBar.show(context, message: "Input the food price");
      return;
    }
    if (state.pickupOrDelivery.isEmpty || pickupOrDelivery.isEmpty) {
      AppSnackBar.show(context, message: "Select delivery method");
      return;
    }
    if (ingredients.isEmpty) {
      AppSnackBar.show(context,
          message: "Please select at least one basic and a fruit");
      return;
    }
    if (state.foodDetails.isEmpty || foodDetails.isEmpty) {
      AppSnackBar.show(context, message: "Input the food details");
      return;
    }

    // Upload images and get the URls
    List<String> uploadImagesUrl = [];
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try {
      for (var imagePath in foodImages) {
        File imageFile = File(imagePath);
        String fileName =
            'food_image_${state.foodName}_${DateTime.now().millisecondsSinceEpoch}.jpg';
        String imageUrl =
            await AddNewFoodRepo.uploadImage(imageFile, fileName);
        uploadImagesUrl.add(imageUrl);
      }
    } catch (e) {
      AppSnackBar.show(context,
          message: "Error uploading images: ${e.toString()}");
      return;
    }

    // Create the food model
    FoodModel foodModel = FoodModel(
      // Supabase will generate the ID
      foodName: foodName,
      foodImages: uploadImagesUrl,
      price: foodPrice,
      foodDetails: foodDetails,
      pickupOrDelivery: pickupOrDelivery,
      ingredients: ingredients,
    );

    try {
      await AddNewFoodRepo.addNewFoodRepo(foodModel);

      AppSnackBar.show(context,
          message: "Food item added successfully");

      // Clear state
      ref.read(addNewFoodNotifierProvider.notifier).resetState();

      foodPriceController.clear();
      foodNameController.clear();
      foodDetailsController.clear();
    } catch (e) {
      AppSnackBar.show(context,
          message: "Error adding food(${e.toString()}");
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }
}
