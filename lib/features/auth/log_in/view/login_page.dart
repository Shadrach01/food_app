import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/global_loader/global_loader.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/text_res.dart';
import 'package:food_app/features/auth/log_in/provider/log_in_notifier.dart';
import 'package:food_app/features/auth/log_in/widget/login_container_widgets.dart';
import '../controller/log_in_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late LogInController _controller;

  @override
  void didChangeDependencies() {
    _controller = LogInController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(appLoaderProvider);
    return Scaffold(
      backgroundColor: ColorRes.appKDarkBlack,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 70),
            const Center(
              child: Text(
                "Log In",
                style: TextStyle(
                  color: ColorRes.appKWhite,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Center(
              child: Text(
                TextRes.logintext,
                style: TextStyle(
                  color: ColorRes.appKWhite,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: SingleChildScrollView(
                child: LoginContainerWidgets(
                  emailController: _controller.emailController,
                  passwordController: _controller.passwordController,
                  isLoading: loader,
                  onEmailChanged: (value) => ref
                      .read(loginNotifierProvider.notifier)
                      .onUserEmailChanged(value),
                  onPasswordChanged: (value) => ref
                      .read(loginNotifierProvider.notifier)
                      .onUserPasswordChanged(value),
                  onTap: () => _controller.handleLogIn(ref, context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
