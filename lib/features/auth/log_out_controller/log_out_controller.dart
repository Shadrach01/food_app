import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:food_app/features/auth/log_out_repo/log_out_repo.dart';

// LogOut class
class LogOutController {
  LogOutController();

  // Handle the logOut

  Future<void> handleLogOut(WidgetRef ref) async {
    LogOutRepo.logOut();
  }
}
