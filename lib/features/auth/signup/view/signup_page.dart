import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/common/app_snackbar.dart';

import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/text_res.dart';
import 'package:food_app/features/auth/repository/auth_service.dart';
import 'package:food_app/features/auth/signup/widget/signup_container_widgets.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final rPwController = TextEditingController();

  bool isLoading = false;

  onSignUp() async {
    final name = nameController.text;
    final email = emailController.text;
    final pw = pwController.text;
    final rePw = rPwController.text;

    if (pw != rePw) {
      AppSnackBar.show(context,
          message: "Your passwords do not match");
      return;
    }

    setState(() {
      isLoading = true;
    });

    // await ref
    //     .read(authServiceProvider)
    //     .signUpWithEmailPassword(email, name, pw, context);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        child: GestureDetector(
                          onTap: () => context.pop(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                                height: 50,
                                width: 50,
                                color: ColorRes.appKWhite,
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 18,
                                )),
                          ),
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
                          nameController: nameController,
                          emailController: emailController,
                          pwController: pwController,
                          rPwController: rPwController,
                          isLoading: isLoading,
                          onSignUp: () async {
                            await onSignUp();
                          },
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
