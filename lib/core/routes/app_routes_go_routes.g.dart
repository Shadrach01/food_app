import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/routes/app_route_names.dart';
import 'package:food_app/core/routes/auth_routes/auth_enum_class.dart';
import 'package:food_app/core/routes/auth_routes/auth_state_notifier/auth_state_notifier.dart';
import 'package:food_app/features/auth/chef_or_user/view/chef_or_user.dart';
import 'package:food_app/features/auth/log_in/view/login_page.dart';
import 'package:food_app/features/auth/please_wait_page/please_wait_page.dart';
import 'package:food_app/features/auth/signup/chef/view/chef_signup_page.dart';
import 'package:food_app/features/auth/signup/user/view/user_signup_page.dart';
import 'package:food_app/features/is_chef/add_new_food/view/add_new_food_page.dart';
import 'package:food_app/features/is_chef/chef_food_list/view/chef_food_list_page.dart';
import 'package:food_app/features/is_chef/chef_profile/view/chef_profile_page.dart';
import 'package:food_app/features/is_chef/notifications/view/notifications_page.dart';
import 'package:food_app/features/is_chef/ordered_food_details/view/ordered_food_details.dart';
import 'package:food_app/features/is_user/edit_cart/view/edit_cart_page.dart';
import 'package:food_app/features/is_user/my_order_page/view/my_orders_page.dart';
import 'package:food_app/features/onboarding/view/onboarding_screen.dart';
import 'package:go_router/go_router.dart';
import '../../../features/is_user/add_card/view/add_card_page.dart';
import '../../../features/is_user/edit_profile/view/edit_profile_page.dart';
import '../../../features/is_user/food_details/view/food_details_page.dart';
import '../../../features/is_user/food_page/view/food_page.dart';
import '../../../features/is_user/home_page/view/home_page.dart';
import '../../../features/is_user/menu_page/view/menu_page.dart';
import '../../../features/is_user/payment_method_page/view/payment_method.dart';
import '../../../features/is_user/payment_successful_page/view/payment_successful_page.dart';
import '../../../features/is_user/personal_profile/view/personal_profile_page.dart';
import '../../../features/is_user/search_page/view/search_page.dart';
import '../../../features/is_user/track_order/view/track_order_page.dart';
import '../../features/is_chef/chef_home_page/view/chef_dash_board.dart';

part 'app_routes_go_router.dart';
