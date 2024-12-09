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
import 'auth_routes/provider/user_auth_provider.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final authService = ref.watch(authServiceProvider);

    final userAuth = ref.watch(userAuthProvider);

    if (kDebugMode) {
      print('UserAuth state: $userAuth');
    }

    if (authService.isLoggedIn) {
      // Fetch the  is_chef status and update the userAuthProvider
      authService.getIsChefStatus().then((isChef) {
        ref.read(userAuthProvider.notifier).state =
            isChef ? UserAuthState.chef : UserAuthState.user;
      });
    }

    return GoRouter(
      initialLocation: _getInitialRoute(userAuth),
      routes: [
        /*

        Auth routes

         */
        GoRoute(
          path: AppRouteNames.chefSignUpRoute,
          builder: (context, state) => const ChefSignUpPage(),
        ),
        GoRoute(
          path: AppRouteNames.onboardingRoute,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: AppRouteNames.loadingRoute,
          builder: (context, state) => const PleaseWaitPage(),
        ),
        GoRoute(
          path: '/login',
          name: AppRouteNames.loginRoute,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/signup',
          name: AppRouteNames.userSignupRoute,
          builder: (context, state) => const SignUpPage(),
        ),
        GoRoute(
          path: '/confirmChefPage',
          name: AppRouteNames.confirmChefRoute,
          builder: (context, state) => const ChefOrUser(),
        ),

        /*

         User routes
         */
        GoRoute(
          path: '/userHomePage',
          name: AppRouteNames.homePageRoute,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/profilePage',
          name: AppRouteNames.profileRoute,
          builder: (context, state) => const MenuPage(),
        ),
        GoRoute(
          path: '/homeSearchPage',
          name: AppRouteNames.homeSearchPageRoute,
          builder: (context, state) => const SearchPage(),
        ),
        GoRoute(
          path: '/foodPage',
          name: AppRouteNames.foodPageRoute,
          builder: (context, state) => const FoodPage(),
        ),
        GoRoute(
          path: '/foodDetails',
          name: AppRouteNames.foodDetailsRoute,
          builder: (context, state) => const FoodDetailsPage(),
        ),
        GoRoute(
          path: '/editCart',
          name: AppRouteNames.editCartRoute,
          builder: (context, state) => const EditCartPage(),
        ),
        GoRoute(
          path: '/paymentMethod',
          name: AppRouteNames.paymentMethodRoute,
          builder: (context, state) => const PaymentMethodPage(),
        ),
        GoRoute(
          path: '/addCard',
          name: AppRouteNames.addCardRoute,
          builder: (context, state) => const AddCardPage(),
        ),
        GoRoute(
          path: '/paymentSuccessful',
          name: AppRouteNames.paymentSuccessfulRoute,
          builder: (context, state) => const PaymentSuccessfulPage(),
        ),
        GoRoute(
          path: '/trackOrder',
          name: AppRouteNames.trackOrderRoute,
          builder: (context, state) => const TrackOrderPage(),
        ),
        GoRoute(
          path: '/myOrders',
          name: AppRouteNames.myOrdersRoute,
          builder: (context, state) => const MyOrdersPage(),
        ),
        GoRoute(
          path: '/personalProfilePage',
          name: AppRouteNames.personalProfileRoute,
          builder: (context, state) => const PersonalProfilePage(),
        ),
        GoRoute(
          path: '/editProfilePage',
          name: AppRouteNames.editProfileRoute,
          builder: (context, state) => const EditProfilePage(),
        ),

        /*

         Chef routes
         */
        GoRoute(
          path: '/chefDashBoard',
          name: AppRouteNames.dashBoardRoute,
          builder: (context, state) => const ChefDashBoard(),
        ),
        GoRoute(
          path: '/chefProfilePage',
          name: AppRouteNames.chefProfileRoute,
          builder: (context, state) => const ChefProfilePage(),
        ),
        GoRoute(
          path: '/chefFoodListPage',
          name: AppRouteNames.chefFoodListRoute,
          builder: (context, state) => const ChefFoodListPage(),
        ),
        GoRoute(
          path: '/chefAddNewFoodPage',
          name: AppRouteNames.chefAddNewFoodRoute,
          builder: (context, state) => const AddNewFoodPage(),
        ),
        GoRoute(
          path: '/orderedFoodDetailsPage',
          name: AppRouteNames.orderedFoodDetailsRoute,
          builder: (context, state) => const OrderedFoodDetails(),
        ),
        GoRoute(
          path: '/notificationsPage',
          name: AppRouteNames.notificationsRoute,
          builder: (context, state) => const NotificationsPage(),
        ),
      ],
    );
  },
);

String _getInitialRoute(UserAuthState userAuth) {
  switch (userAuth) {
    case UserAuthState.loading:
      return AppRouteNames.loadingRoute;
    case UserAuthState.unauthenticated:
      return AppRouteNames.onboardingRoute;
    case UserAuthState.user:
      return AppRouteNames.homePageRoute;
    case UserAuthState.chef:
      return AppRouteNames.dashBoardRoute;

    default:
      return AppRouteNames.onboardingRoute;
  }
}
