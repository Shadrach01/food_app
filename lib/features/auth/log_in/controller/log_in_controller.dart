/*

CONTROLLER CLASS FOR THE LOGIN PAGE

  THIS CLASS HANDLE CALLING THE LOG IN
  IT TAKES IT FUNCTIONS FROM THE LOGIN REPO AND NOTIFIER CLASSES

 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/app_snackbar.dart';
import 'package:food_app/core/global_loader/global_loader.dart';
import 'package:food_app/features/auth/log_in/provider/log_in_notifier.dart';
import 'package:food_app/features/auth/log_in/repo/log_in_repo.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogInController {
  LogInController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Handle the Login
  Future<void> handleLogIn(
      WidgetRef ref, BuildContext context) async {
    // Get the state
    var state = ref.read(loginNotifierProvider);

    /// Get the parameters gotten from the states
    /// and store them in these variables
    String email = state.email;
    String password = state.password;

    /// Pass the gotten parameters from the controllers in the UI
    /// to the variables above
    emailController.text = email;
    passwordController.text = password;

    if (state.email.isEmpty || email.isEmpty) {
      AppSnackBar.show(context, message: "Your email is empty");
      return;
    }

    if (state.password.isEmpty || password.isEmpty) {
      AppSnackBar.show(context, message: "Your password is empty");
      return;
    }

    // Set the loading value to true to show the loading circle
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      final credential =
          await LogInRepo.signInWithEmailPassword(email, password);

      // Check if user exist in the database
      if (credential.user == null) {
        AppSnackBar.show(context, message: "User not found");
        return;
      }
      context.go('/homePage');
    } on AuthException catch (e) {
      AppSnackBar.show(context, message: e.message);

      return;
    } catch (e) {
      AppSnackBar.show(context, message: e.toString());

      return;
    } finally {
      // Ensure the loader is turned off
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }
}
