import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/routes/auth_routes/auth_enum_class.dart';
import 'package:food_app/core/routes/auth_routes/provider/user_auth_provider.dart';
import 'package:food_app/core/utils/constants/appConstants.dart';
import 'package:food_app/features/is_user/menu_page/repo/log_out_repo/log_out_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

// LogOut class
class LogOutController {
  LogOutController();

  // Handle the logOut

  Future<void> handleLogOut(WidgetRef ref) async {
    LogOutRepo.logOut();
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.remove(Constants().AUTH_USER_ROLE);
    // ref
    //     .read(userAuthProvider.notifier)
    //     .setUserAuth(UserAuth.unauthenticated);
  }
}
