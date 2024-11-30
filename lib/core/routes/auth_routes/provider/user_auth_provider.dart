import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/routes/auth_routes/auth_enum_class.dart';
import 'package:food_app/core/routes/auth_routes/auth_state_notifier/auth_state_notifier.dart';
import 'package:food_app/core/routes/auth_routes/provider/is_loading_provider.dart';

final userAuthProvider = StateProvider<UserAuthState>((ref) {
  final authService = ref.read(authServiceProvider);

  // Check if the user is logged in
  final session = authService.currentSession;

  if (session != null) {
    // Fetch user details to determine the role (chef or user)

    final userData = session.user;

    // Fetch additional data like 'is_chef' from database
    final isChef = userData.userMetadata?['is_chef'] ?? false;
    return isChef ? UserAuthState.chef : UserAuthState.user;
  }

  // Default to unauthenticated if no session exists
  return UserAuthState.unauthenticated;
});
