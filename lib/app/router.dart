import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/onboarding/welcome_screen.dart';
import '../features/home/home_shell.dart';
import '../features/trips/presentation/create_trip_screen.dart';
import '../features/trips/presentation/generating_screen.dart';
import '../features/trips/presentation/trip_detail_screen.dart';
import 'auth_session.dart';

class AppRouter {
  static const String welcome = '/';
  static const String home = '/home';
  static const String create = '/create';
  static const String generating = '/generating';

  static String tripPath(String tripId) => '/trip/$tripId';

  static const _guarded = {create, generating};
}

final routerProvider = Provider<GoRouter>((ref) {
  final refresh = _RouterRefresh(ref);
  ref.onDispose(refresh.dispose);

  return GoRouter(
    initialLocation: AppRouter.welcome,
    refreshListenable: refresh,
    redirect: (context, state) {
      final signedIn = ref.read(authSessionProvider);
      final location = state.matchedLocation;
      final needsAuth =
          AppRouter._guarded.contains(location) || location.startsWith('/trip/');
      if (!signedIn && needsAuth) return AppRouter.welcome;
      return null;
    },
    routes: [
      GoRoute(
        path: AppRouter.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: AppRouter.home,
        builder: (context, state) => const HomeShell(),
      ),
      GoRoute(
        path: AppRouter.create,
        builder: (context, state) => const CreateTripScreen(),
      ),
      GoRoute(
        path: AppRouter.generating,
        builder: (context, state) => const GeneratingScreen(),
      ),
      GoRoute(
        path: '/trip/:tripId',
        builder: (context, state) {
          return TripDetailScreen(tripId: state.pathParameters['tripId']!);
        },
      ),
    ],
  );
});

class _RouterRefresh extends ChangeNotifier {
  _RouterRefresh(Ref ref) {
    ref.listen(authSessionProvider, (previous, next) => notifyListeners());
  }
}
