import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/app_snackbar.dart';
import 'package:food_app/core/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

final authServiceProvider =
    Provider((ref) => AuthService(supabase: Supabase.instance.client));

class AuthService {
  SupabaseClient supabase;

  AuthService({
    required this.supabase,
  });

  // Sign in with email and password
  Future<AuthResponse> signInWithEmailPassword(
      String email, String password) async {
    return await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // Sign up with email and password
  Future<AuthResponse?> signUpWithEmailPassword(
    String email,
    String name,
    String password,
    BuildContext context,
  ) async {
    try {
      final authResponse = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = authResponse.user;

      //INSERT USER DATA TO DATABASE AFTER USER HAS BEEN SUCCESSFULLY CREATED
      if (user != null) {
        // final userUuid = Uuid.parse(user.id);
        final UserModel userModel = UserModel(
          // userId: user.id,
          name: name,
          email: email,
          hasActiveOrder: false,
        );
        print("Data sent to supabse: ${userModel.toMap()}");
        await supabase.from('users').insert(userModel.toMap());
      }

      return authResponse;
    } on AuthException catch (e) {
      AppSnackBar.show(context, message: e.message);
      return null;
    } catch (e) {
      AppSnackBar.show(context, message: e.toString());

      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  // Get user email
  String? getUserEmail() {
    final session = supabase.auth.currentSession;

    final user = session?.user;

    return user?.email;
  }
}
