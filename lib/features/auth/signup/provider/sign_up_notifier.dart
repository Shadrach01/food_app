/*

  SIGN UP NOTIFIER CLASS USING THE SIGN UP STATE
  WITH THE RIVERPOD STATE NOTIFIER

 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/features/auth/signup/provider/sign_up_state.dart';

class SignUpNotifier extends StateNotifier<SignUpState> {
  SignUpNotifier() : super(SignUpState());

  void onNameChanged(String name) {
    state = state.copyWith(name: name);
  }

  onEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  confirmPasswordChanged(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }
}

final signUpNotifierProvider =
    StateNotifierProvider<SignUpNotifier, SignUpState>(
        (ref) => SignUpNotifier());
