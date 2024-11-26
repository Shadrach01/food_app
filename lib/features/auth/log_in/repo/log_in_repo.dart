/*

  CLASS FOR THE IMPLEMENTATION FOR SUPABASE LOG IN METHOD

 */

import 'package:supabase_flutter/supabase_flutter.dart';

class LogInRepo {
  static Future<AuthResponse> signInWithEmailPassword(
      String email, String password) async {
    final credential =
        await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    return credential;
  }
}
