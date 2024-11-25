import 'package:flutter/material.dart';
import 'package:food_app/features/edit_profile/widgets/edit_profile_widgets.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EditProfileWidgets(),
    );
  }
}
