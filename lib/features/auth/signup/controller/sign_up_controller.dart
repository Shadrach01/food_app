/*

CONTROLLER CLASS FOR THE SIGNUP PAGE

  THIS CLASS HANDLE CALLING THE SIGN UP
  IT TAKES IT FUNCTIONS FROM THE SIGN UP REPO AND NOTIFIER CLASSES

 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/app_snackbar.dart';
import 'package:food_app/core/global_loader/global_loader.dart';
import 'package:food_app/core/routes/app_route_names.dart';
import 'package:food_app/features/auth/signup/provider/sign_up_notifier.dart';
import 'package:food_app/features/auth/signup/repo/sign_up_repo.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/models/user_model.dart';

class SignUpController {
  SignUpController();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> handleSignUp(
      BuildContext context, WidgetRef ref) async {
    var state = ref.read(signUpNotifierProvider);

    //

    String name = state.name;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    nameController.text = name;
    emailController.text = email;
    passwordController.text = password;
    confirmPasswordController.text = confirmPassword;

    if (state.name.isEmpty || name.isEmpty) {
      AppSnackBar.show(context, message: "Your name is empty");
      return;
    }

    if (state.email.isEmpty || email.isEmpty) {
      AppSnackBar.show(context, message: "Your email is empty");
      return;
    }

    if (state.password.isEmpty ||
        state.confirmPassword.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      AppSnackBar.show(context, message: "Your password is empty");
      return;
    }

    if (state.password != state.confirmPassword ||
        password != confirmPassword) {
      AppSnackBar.show(context,
          message: "Your passwords does not match");
      return;
    }

    // Show the loading icon
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      final credential = await SignUpRepo.signUp(email, password);
      if (kDebugMode) {
        print(credential);
      }

      final user = credential.user;

      if (user != null) {
        final String userId = user.id;
        final UserModel userModel = UserModel(
          uid: userId,
          name: name,
          email: email,
        );
        print("Data sent to supabse: ${userModel.toMap()}");

        final database = Supabase.instance.client.from('users');

        await database.insert(userModel.toMap());
      }

      if (credential.user == null) {
        AppSnackBar.show(context, message: "User not found");
        return;
      }
      context.go(AppRouteNames.confirmChefRoute);
    } on AuthException catch (e) {
      print(e.message);
      AppSnackBar.show(context, message: e.message);
    } catch (e) {
      print(e.toString());
      AppSnackBar.show(context, message: e.toString());
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }
}
