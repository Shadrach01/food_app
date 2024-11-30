import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/widgets/custom_app_bar.dart';
import 'package:food_app/core/global_loader/global_loader.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/text_res.dart';
import 'package:food_app/features/auth/signup/controller/sign_up_controller.dart';
import 'package:food_app/features/auth/signup/widget/signup_container_widgets.dart';

import '../provider/sign_up_notifier.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  late SignUpController _controller;

  @override
  void didChangeDependencies() {
    _controller = SignUpController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(appLoaderProvider);
    return Scaffold(
      backgroundColor: ColorRes.appKDarkBlack,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: CustomAppBar(
                          leadingContainerColor:
                              ColorRes.appKWhite.withOpacity(.8),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Center(
                        child: Text(
                          "Sign Up",
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
                          TextRes.signUpText,
                          style: TextStyle(
                            color: ColorRes.appKWhite,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Expanded(
                        child: SignUpContainerWidgets(
                          nameController: _controller.nameController,
                          emailController:
                              _controller.emailController,
                          pwController:
                              _controller.passwordController,
                          rPwController:
                              _controller.confirmPasswordController,
                          onNameChanged: (value) => ref
                              .read(signUpNotifierProvider.notifier)
                              .onNameChanged(value),
                          onEmailChanged: (value) => ref
                              .read(signUpNotifierProvider.notifier)
                              .onEmailChanged(value),
                          onPasswordChanged: (value) => ref
                              .read(signUpNotifierProvider.notifier)
                              .onPasswordChanged(value),
                          onConfirmPasswordChanged: (value) => ref
                              .read(signUpNotifierProvider.notifier)
                              .confirmPasswordChanged(value),
                          isLoading: loader,
                          onSignUp: () =>
                              _controller.handleSignUp(context, ref),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
