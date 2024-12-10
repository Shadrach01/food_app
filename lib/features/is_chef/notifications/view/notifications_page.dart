import 'package:flutter/material.dart';
import 'package:food_app/features/is_chef/notifications/widgets/notifications_widgets.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NotificationsWidgets(),
    );
  }
}
