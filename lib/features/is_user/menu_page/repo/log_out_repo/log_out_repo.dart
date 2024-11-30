// Log Out Supabase repo

import 'package:supabase_flutter/supabase_flutter.dart';

class LogOutRepo {
  static Future<void> logOut() async {
    await Supabase.instance.client.auth.signOut();
  }
}
