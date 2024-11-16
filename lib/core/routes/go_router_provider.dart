import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/core/routes/route_name.dart';
import 'package:food_app/features/auth/log_in/view/login_page.dart';
import 'package:food_app/features/auth/signup/view/signup_page.dart';
import 'package:food_app/features/food_page/view/food_page.dart';
import 'package:food_app/features/home_page/view/home_page.dart';
import 'package:food_app/features/onboarding/view/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

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
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/homeSearchPage',
          name: RouteName.homeSearchPageRoute,
          builder: (context, state) => const HomePageSearch(),
        ),
        GoRoute(
          path: '/foodPage',
          name: RouteName.foodPageRoute,
          builder: (context, state) => const FoodPage(),
        ),
      ],
    );
  },
);
