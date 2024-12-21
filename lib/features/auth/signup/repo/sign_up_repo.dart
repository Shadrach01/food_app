/*

  CLASS FOR THE IMPLEMENTATION FOR SUPABASE SIGN UP METHOD

 */
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpRepo {
  static Future<AuthResponse> signUp(
      String email, String password) async {
    final credential = await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
    );

    return credential;
  }

  // Method to upload the restaurant image to supabase
  static Future<String> uploadImage(
      File image, String imageName) async {
    final fileName = imageName;
    final path = 'uploads/$fileName';

    // Upload image to Supabase storage
    await Supabase.instance.client.storage
        .from('restaurant_images')
        .upload(path, image);

    // Return back to image url in supabase
    final imageUrl = Supabase.instance.client.storage
        .from('restaurant_images')
        .getPublicUrl(path);

    return imageUrl;
  }
}
