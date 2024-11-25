import 'package:flutter/material.dart';
import 'package:food_app/features/personal_profile/widgets/personal_profile_widgets.dart';

class PersonalProfilePage extends StatelessWidget {
  const PersonalProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PersonalProfileWidgets(),
    );
  }
}
