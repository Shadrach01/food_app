// The selected food details to be shown
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/models/food_model.dart';

final selectedFoodModelProvider =
    StateProvider<FoodModel?>((ref) => null);
