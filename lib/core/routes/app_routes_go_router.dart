part of 'app_routes_go_routes.g.dart';

final goRouterProvider = FutureProvider<GoRouter>(
  (ref) async {
    final authService = ref.watch(authServiceProvider);

    // Fetch the user role
    final userRole = await authService.getUserRole();

    if (kDebugMode) {
      print('UserAuth state: $userRole');
    }

    return GoRouter(
      initialLocation: _getInitialRoute(userRole),
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

String _getInitialRoute(UserRole userRole) {
  switch (userRole) {
    case UserRole.unauthenticated:
      return AppRouteNames.onboardingRoute;
    case UserRole.normalUser:
      return AppRouteNames.homePageRoute;
    case UserRole.chef:
      return AppRouteNames.dashBoardRoute;

    default:
      return AppRouteNames.onboardingRoute;
  }
}
