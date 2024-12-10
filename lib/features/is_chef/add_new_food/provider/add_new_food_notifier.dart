import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/features/is_chef/add_new_food/provider/add_new_food_state.dart';

class AddNewFoodNotifier extends StateNotifier<AddNewFoodState> {
  AddNewFoodNotifier() : super(AddNewFoodState());

  void onFoodNameChanged(String foodName) {
    state = state.copyWith(foodName: foodName);
  }

  void updateImageAtIndex(int index, String newImagePath) {
    final updateImages = List<String>.from(state.foodImages);

    // Update the image at the specified index
    if (index < updateImages.length) {
      updateImages[index] = newImagePath;
    } else {
      // Add the image if the index is out of bound
      updateImages.add(newImagePath);
    }

    // Update the state with the modified image list
    state = state.copyWith(foodImages: updateImages);
  }

  void onPriceSelected(String price) {
    state = state.copyWith(price: price);
  }

  void onPickUpOrDeliverySelected(String option) {
    state = state.copyWith(pickupOrDelivery: option);
  }

  void onIngredientsSelected(List<String> ingredients) {
    state = state.copyWith(ingredients: ingredients);
  }

  void onFoodDetailsChanged(String details) {
    state = state.copyWith(foodDetails: details);
  }

  // Clear the entire state
  void resetState() {
    state = AddNewFoodState();
  }
}

final addNewFoodNotifierProvider =
    StateNotifierProvider<AddNewFoodNotifier, AddNewFoodState>(
        (ref) => AddNewFoodNotifier());
