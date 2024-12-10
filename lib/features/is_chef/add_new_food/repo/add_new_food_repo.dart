/*

  CLASS FOR THE IMPLEMENTATION TO ADD A FOOD ITEM

 */

import 'dart:io';

import 'package:food_app/core/models/food_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddNewFoodRepo {
  static Future<Map<String, dynamic>> addNewFoodRepo(
      FoodModel foodModel) async {
    final response = await Supabase.instance.client
        .from("food_item")
        .insert(foodModel.toMap())
        .select();

    // Supabase's `insert` method typically returns a list of inserted rows
    if (response.isEmpty) {
      throw Exception(
          "Unexpected response format or no data inserted.");
    }

    // Return the first inserted row as a map
    return response.first;
  }

  // Method to add food images to storage
  static Future<String> uploadImage(
      File image, String imageName) async {
    final fileName = imageName;
    final path = 'uploads/$fileName';

    //Upload image to Supabase storage
    await Supabase.instance.client.storage
        .from('food_images')
        .upload(path, image);

    // Return the public URL for the uploaded image

    final imageUrl = Supabase.instance.client.storage
        .from('food_images')
        .getPublicUrl(path);

    return imageUrl;
  }
}
