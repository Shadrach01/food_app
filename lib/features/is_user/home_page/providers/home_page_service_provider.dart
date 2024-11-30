import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final userNameProvider = FutureProvider<String?>((ref) async {
  // Create an instance of HomePageService
  final homePageService = HomePageService();

  // Fetch and return the user's name
  return await homePageService.fetchUserName();
});

class HomePageService {
  final database = Supabase.instance.client.from('users');

  Future<String?> fetchUserName() async {
    try {
      // Get the authenticated user's id
      final user = Supabase.instance.client.auth.currentUser;

      if (user == null) {
        print("No user is logged in");
        return null;
      }

      final userId = user.id; // User's unique Identifier

      // Query the users table fot the User's name
      final response = await database
          .select('name')
          .eq('uid', userId)
          .single(); // The .single() fetches only one result

      return response['name'];
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
