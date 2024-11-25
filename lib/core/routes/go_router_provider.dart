import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/routes/route_name.dart';
import 'package:food_app/features/add_card/view/add_card_page.dart';
import 'package:food_app/features/auth/log_in/view/login_page.dart';
import 'package:food_app/features/auth/signup/view/signup_page.dart';
import 'package:food_app/features/edit_cart/view/edit_cart_page.dart';
import 'package:food_app/features/edit_profile/view/edit_profile_page.dart';
import 'package:food_app/features/food_details/view/food_details_page.dart';
import 'package:food_app/features/food_page/view/food_page.dart';
import 'package:food_app/features/home_page/view/home_page.dart';
import 'package:food_app/features/menu_page/view/menu_page.dart';
import 'package:food_app/features/my_order_page/view/my_orders_page.dart';
import 'package:food_app/features/onboarding/view/onboarding_screen.dart';
import 'package:food_app/features/payment_successful_page/view/payment_successful_page.dart';
import 'package:food_app/features/personal_profile/view/personal_profile_page.dart';
import 'package:food_app/features/search_page/view/search_page.dart';
import 'package:food_app/features/track_order/view/track_order_page.dart';
import 'package:go_router/go_router.dart';
import '../../features/payment_method_page/view/payment_method.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/homePage',
      routes: [
        GoRoute(
          path: '/onboarding',
          name: RouteName.onboardingRoute,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: '/login',
          name: RouteName.loginRoute,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/signup',
          name: RouteName.signupRoute,
          builder: (context, state) => const SignUpPage(),
        ),
        GoRoute(
          path: '/homePage',
          name: RouteName.homePageRoute,
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: '/profilePage',
          name: RouteName.profileRoute,
          builder: (context, state) => const MenuPage(),
        ),
        GoRoute(
          path: '/homeSearchPage',
          name: RouteName.homeSearchPageRoute,
          builder: (context, state) => const SearchPage(),
        ),
        GoRoute(
          path: '/foodPage',
          name: RouteName.foodPageRoute,
          builder: (context, state) => const FoodPage(),
        ),
        GoRoute(
          path: '/foodDetails',
          name: RouteName.foodDetailsRoute,
          builder: (context, state) => const FoodDetailsPage(),
        ),
        GoRoute(
          path: '/editCart',
          name: RouteName.editCartRoute,
          builder: (context, state) => const EditCartPage(),
        ),
        GoRoute(
          path: '/paymentMethod',
          name: RouteName.paymentMethodRoute,
          builder: (context, state) => const PaymentMethodPage(),
        ),
        GoRoute(
          path: '/addCard',
          name: RouteName.addCardRoute,
          builder: (context, state) => const AddCardPage(),
        ),
        GoRoute(
          path: '/paymentSuccessful',
          name: RouteName.paymentSuccessfulRoute,
          builder: (context, state) => const PaymentSuccessfulPage(),
        ),
        GoRoute(
          path: '/trackOrder',
          name: RouteName.trackOrderRoute,
          builder: (context, state) => const TrackOrderPage(),
        ),
        GoRoute(
          path: '/myOrders',
          name: RouteName.myOrdersRoute,
          builder: (context, state) => const MyOrdersPage(),
        ),
        GoRoute(
          path: '/personalProfilePage',
          name: RouteName.personalProfileRoute,
          builder: (context, state) => const PersonalProfilePage(),
        ),
        GoRoute(
          path: '/editProfilePage',
          name: RouteName.editProfileRoute,
          builder: (context, state) => const EditProfilePage(),
        ),
      ],
    );
  },
);
