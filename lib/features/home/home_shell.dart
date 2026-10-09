import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/design/design_tokens.dart';
import '../../core/widgets/app_bottom_nav.dart';
import '../flights/flights_screen.dart';
import '../profile/profile_screen.dart';
import '../trips/trip_overview_screen.dart';
import 'home_hub_screen.dart';

/// Lets routes pushed above [HomeShell] switch its tab, then pop back.
class ShellTabs {
  ShellTabs._();

  static final ValueNotifier<int> index = ValueNotifier<int>(0);
}

/// The main app shell. The tab dock floats over the screens, matching DESIGN.md.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  @override
  void initState() {
    super.initState();
    ShellTabs.index.value = 0;
    ShellTabs.index.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    ShellTabs.index.removeListener(_onTabChanged);
    super.dispose();
  }

  void _onTabChanged() {
    if (mounted) setState(() {});
  }

  static const List<Widget> _screens = [
    HomeHubScreen(),
    TripOverviewScreen(),
    FlightsScreen(),
    ProfileScreen(),
  ];

  static const List<AppBottomNavDestination> _destinations = [
    AppBottomNavDestination(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      label: 'Home',
    ),
    AppBottomNavDestination(
      icon: Icons.map_outlined,
      selectedIcon: Icons.map,
      label: 'Itinerary',
    ),
    AppBottomNavDestination(
      icon: Icons.flight_outlined,
      selectedIcon: Icons.flight,
      label: 'Flights',
    ),
    AppBottomNavDestination(
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(index: ShellTabs.index.value, children: _screens),
          if (ShellTabs.index.value == 0)
            Positioned(
              right: DesignSpacing.marginMobile,
              bottom: DesignMetrics.fabAboveDock,
              child: _PlanTripButton(
                onPressed: () => context.push(AppRouter.create),
              ),
            ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: AppBottomNav(
                  currentIndex: ShellTabs.index.value,
                  onTap: (index) => ShellTabs.index.value = index,
                  destinations: _destinations,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanTripButton extends StatelessWidget {
  const _PlanTripButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: DesignColors.ai,
        boxShadow: DesignElevation.tier2,
      ),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: const SizedBox(
            width: DesignMetrics.fab,
            height: DesignMetrics.fab,
            child: Icon(Icons.add, color: DesignColors.onPrimary),
          ),
        ),
      ),
    );
  }
}
