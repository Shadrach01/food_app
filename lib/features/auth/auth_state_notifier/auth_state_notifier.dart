/*

  CLASS TO MONITOR THE AUTH STATE
  WHETHER USER IS LOGGED IN OR NOT

 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabaseClient;

  AuthService(this._supabaseClient);

  // Check if the user is currently logged in
  bool get isLoggedIn => _supabaseClient.auth.currentSession != null;

  // Auth state change listener
  Stream<AuthChangeEvent> get authStateChanges =>
      _supabaseClient.auth.onAuthStateChange
          .map((event) => event.event);
}

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(Supabase.instance.client),
);
