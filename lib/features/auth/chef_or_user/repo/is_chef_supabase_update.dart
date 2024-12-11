import 'package:food_app/core/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IsChefOrIsUserUpdateRepo {
  static Future<void> updateUserIsChef(bool isChef) async {
    final supabase = Supabase.instance.client;

    // Get the logged-in usr's ID from supabase auth
    final user = supabase.auth.currentUser;

    if (user == null) {
      print("Error : No logged in user");
      return;
    }

    // Save to supabase
    await supabase
        .from('users')
        .update({'is_chef': isChef}).eq('uid', user.id);

    // Fetch the updated user data from supabase
    final response = await supabase
        .from('users')
        .select()
        .eq('uid', user.id)
        .single();

    // Update the UserModel in the app
    UserModel userModel = UserModel.fromMap(response);

    print(userModel);
  }
}
