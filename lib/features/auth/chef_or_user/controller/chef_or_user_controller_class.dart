// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class ChefOrUserController {
//   ChefOrUserController();
//
//   Future<void> isChefOrNot() async {}
// }
//
// Future<void> updateUserIsChef(
//     BuildContext context, WidgetRef ref) async {
//   var state = ref.read(isChefProvider);
//
//   // Get the logged-in usr's ID from supabase auth
//   final user = supabase.auth.currentUser;
//
//   if (user == null) {
//     print("Error : No logged in user");
//     return;
//   }
//
//   try {
//     // Save to supabase
//     await supabase
//         .from('users')
//         .update({'is_chef': state}).eq('uid', user.id);
//
//     // Fetch the updated user data from supabase
//     final response = await supabase
//         .from('users')
//         .select()
//         .eq('uid', user.id)
//         .single();
//
//     // Update the UserModel in the app
//     UserModel userModel = UserModel.fromMap(response);
//
//     print(userModel);
//
//     // Navigate to the correct page on selection
//     if (state == true) {
//       context.go(AppRouteNames.dashBoardRoute);
//     } else {
//       context.go(AppRouteNames.homePageRoute);
//     }
//   } catch (e) {
//     print("Error updating is_chef $e");
//   }
// }
