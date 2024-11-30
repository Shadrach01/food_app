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

  // Retrieve the current session (user data)
  Session? get currentSession => _supabaseClient.auth.currentSession;

  // Get the current user
  User? get currentUser => _supabaseClient.auth.currentUser;

  // Auth state change listener
  Stream<AuthChangeEvent> get authStateChanges =>
      _supabaseClient.auth.onAuthStateChange
          .map((event) => event.event);

  // Fetch the is_chef status of the logged-in user
  Future<bool> getIsChefStatus() async {
    final user = _supabaseClient.auth.currentUser;

    if (user != null) {
      final response = await _supabaseClient
          .from('users')
          .select('is_chef')
          .eq('uid', user.id)
          .single();

      return response['is_chef'] as bool;
    }
    return false;
  }
}

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(Supabase.instance.client),
);
