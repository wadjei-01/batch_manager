import 'package:bloc_test/src/screens/create/create_screen.dart';
import 'package:bloc_test/src/screens/home/home_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final routerProvider =
      GoRouter(initialLocation: HomeScreen.id, routes: [
    GoRoute(
      path: HomeScreen.id,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: CreateScreen.id,
      builder: (context, state) => CreateScreen(),
    ),
  ]);
}
