/*

  CLASS TO MONITOR THE AUTH STATE
  WHETHER USER IS LOGGED IN OR NOT

 */

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../auth_enum_class.dart';

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

  // Determine if the user is a chef or a normal user

  Future<UserRole> getUserRole() async {
    final user = _supabaseClient.auth.currentUser;

    if (user == null) {
      return UserRole.unauthenticated;
    }

    try {
      // Check if the user exists in the chef table
      final chefResponse = await _supabaseClient
          .from('chefs')
          .select('id')
          .eq('uid', user.id)
          .maybeSingle();
      if (chefResponse != null) {
        return UserRole.chef;
      }

      // Check in the normal_user table if user exists
      final normalUserResponse = await _supabaseClient
          .from('normal_users')
          .select('id')
          .eq('uid', user.id)
          .maybeSingle();
      if (normalUserResponse != null) {
        return UserRole.normalUser;
      }

      // if (chefResponse != null) {
      //   return UserRole.chef;
      // } else if (normalUserResponse != null) {
      //   return UserRole.normalUser;
      // } else {
      //   return UserRole.unauthenticated;
      // }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user role: $e');
      }
    }
    return UserRole.unauthenticated;
  }
}

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(Supabase.instance.client),
);
