class FoodModel {
  final String? foodName;
  final List<String>? foodImages;
  final String? price;
  final String? foodDetails;
  final String? foodType;
  final String? pickupOrDelivery;
  final List<String>? ingredients;

  FoodModel({
    this.foodName,
    this.foodImages,
    this.price,
    this.foodDetails,
    this.foodType,
    this.pickupOrDelivery,
    this.ingredients,
  });

  // Convert to JSON/ Map format to send out
  Map<String, dynamic> toMap() {
    return {
      "food_name": foodName,
      "food_images": foodImages,
      "price": price,
      "food_details": foodDetails,
      "food_type": foodType,
      "pick_up_or_delivery": pickupOrDelivery,
      "ingredients": ingredients,
    };
  }

  // Receive as JSON/ Map format
  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      foodName: map["food_name"],
      foodImages: List<String>.from(
        map["food_images"] ?? [],
      ),
      price: map["price"],
      foodDetails: map["food_details"],
      foodType: map["food_type"],
      pickupOrDelivery: map["pick_up_or_delivery"],
      ingredients: List<String>.from(
        map["ingredients"] ?? [],
      ),
    );
  }
}
