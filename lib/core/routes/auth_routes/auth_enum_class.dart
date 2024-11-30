import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/routes/auth_routes/auth_state_notifier/auth_state_notifier.dart';

final userAuthTypeProvider =
    StateNotifierProvider<UserAuthNotifier, UserAuthState>(
  (ref) => UserAuthNotifier(),
);

class UserAuthNotifier extends StateNotifier<UserAuthState> {
  UserAuthNotifier() : super(UserAuthState.loading);

  Future<void> initialize(AuthService authService) async {
    // Check if the user is logged in
    final isLoggedIn = authService.isLoggedIn;

    if (!isLoggedIn) {
      state = UserAuthState.unauthenticated;
      return;
    }

    // Fetch role
    final isChef = await authService.getIsChefStatus();
    state = isChef ? UserAuthState.chef : UserAuthState.user;
  }
}

enum UserAuthState {
  unauthenticated, // Initial state before login/signup
  loading,
  user, // Regular user
  chef, // Chef user
}
