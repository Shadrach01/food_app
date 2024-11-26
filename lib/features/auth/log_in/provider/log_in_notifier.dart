/*

  LOG IN NOTIFIER CLASS USING THE LOG IN STATE
  WITH THE RIVERPOD STATE NOTIFIER

 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/features/auth/log_in/provider/log_in_state.dart';

class LogInNotifier extends StateNotifier<LogInState> {
  LogInNotifier() : super(const LogInState());

  void onUserEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onUserPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }
}

// Provider that will be used to access the above class
final loginNotifierProvider =
    StateNotifierProvider<LogInNotifier, LogInState>(
        (ref) => LogInNotifier());
