import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app_theme.dart';
import 'app/router.dart';
import 'core/app_error_widget.dart';
import 'core/constants.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return AppErrorWidget(details: details);
  };
  runApp(const TripMindApp());
}

class TripMindApp extends StatelessWidget {
  const TripMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: TripMindRoot());
  }
}

class TripMindRoot extends ConsumerWidget {
  const TripMindRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      routerConfig: router,
    );
  }
}
