/*

CLASS FOR THE ADD NEW FOOD UI STATE

 */

class AddNewFoodState {
  final String foodId;
  final String foodName;
  final List<String> foodImages;
  final String price;
  final String foodDetails;
  final String foodType;
  final String pickupOrDelivery;
  final List<String> ingredients;

  AddNewFoodState({
    this.foodId = '',
    this.foodName = '',
    List<String>? foodImages,
    this.price = '',
    this.foodDetails = '',
    this.foodType = '',
    this.pickupOrDelivery = '',
    List<String>? ingredients,
  })  : foodImages = foodImages ?? [],
        ingredients = ingredients ?? [];

  AddNewFoodState copyWith({
    String? foodId,
    String? foodName,
    List<String>? foodImages,
    String? price,
    String? foodDetails,
    String? foodType,
    String? pickupOrDelivery,
    List<String>? ingredients,
  }) {
    return AddNewFoodState(
      foodId: foodId ?? this.foodId,
      foodName: foodName ?? this.foodName,
      foodImages: foodImages ?? this.foodImages,
      price: price ?? this.price,
      foodDetails: foodDetails ?? this.foodDetails,
      foodType: foodType ?? this.foodType,
      pickupOrDelivery: pickupOrDelivery ?? this.pickupOrDelivery,
      ingredients: ingredients ?? this.ingredients,
    );
  }
}
