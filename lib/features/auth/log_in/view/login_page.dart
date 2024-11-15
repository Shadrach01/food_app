import 'package:flutter/material.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/text_res.dart';
import 'package:food_app/features/auth/log_in/widget/login_container_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorRes.appKDarkBlack,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 70),
            Center(
              child: Text(
                "Log In",
                style: TextStyle(
                  color: ColorRes.appKWhite,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                TextRes.logintext,
                style: TextStyle(
                  color: ColorRes.appKWhite,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 50),
            Expanded(child: LoginContainerWidgets()),
          ],
        ),
      ),
    );
  }
}
