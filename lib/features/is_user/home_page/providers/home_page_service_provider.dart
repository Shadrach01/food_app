import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/models/chefs_model.dart';
import 'package:food_app/core/models/food_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final userNameProvider = FutureProvider<String?>((ref) async {
  // Create an instance of HomePageService
  final homePageService = HomePageService();

  // Fetch and return the user's name
  return await homePageService.fetchUserName();
});

// Available food
final availableFoodProvider =
    FutureProvider.family<List<FoodModel>, String>(
        (ref, foodType) async {
  final homePageService = HomePageService();
  return await homePageService.getAvailableFoodByType(foodType);
});

// Available chefs
final availableRestaurants =
    FutureProvider<List<ChefModel>>((ref) async {
  final homePageService = HomePageService();
  return await homePageService.getRegisteredChef();
});

class HomePageService {
  // Get the normal user database
  final normalUserDatabase =
      Supabase.instance.client.from('normal_users');

  // Get available registered chefs
  final chefDatabase = Supabase.instance.client.from('chefs');

  Future<List<ChefModel>> getRegisteredChef() async {
    try {
      final response = await chefDatabase.select();
      final data = response;
      return data.map((item) => ChefModel.fromMap(item)).toList();
    } catch (e) {
      if (kDebugMode) {
        print("Error : $e");
      }
      throw Exception('Failed to fetch chefs : $e');
    }
  }

  // Get the food table
  final foodDatabase = Supabase.instance.client.from('food_item');

  Future<List<FoodModel>> getAvailableFoodByType(
      String foodType) async {
    try {
      final response =
          await foodDatabase.select().eq('food_type', foodType);

      final data =
          response.map((item) => FoodModel.fromMap(item)).toList();
      return data;
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
      throw Exception('Failed to fetch food items by type: $e');
    }
  }

  Future<String?> fetchUserName() async {
    try {
      // Get the authenticated user's id
      final user = Supabase.instance.client.auth.currentUser;

      if (user == null) {
        if (kDebugMode) {
          print("No user is logged in");
        }
        return null;
      }

      final userId = user.id; // User's unique Identifier

      // Query the users table fot the User's name
      final response = await normalUserDatabase
          .select('name')
          .eq('uid', userId)
          .single(); // The .single() fetches only one result

      return response['name'];
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
