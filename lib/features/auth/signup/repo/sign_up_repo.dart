/*

  CLASS FOR THE IMPLEMENTATION FOR SUPABASE SIGN UP METHOD

 */
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
}
