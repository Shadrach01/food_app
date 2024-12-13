import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/routes/app_routes_go_routes.g.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouterAsync = ref.watch(goRouterProvider);

    return goRouterAsync.when(
      data: (goRouter) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: goRouter,
      ),
      error: (error, stack) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
      loading: () => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
