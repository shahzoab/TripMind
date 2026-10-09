import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/design/design_tokens.dart';
import '../../../core/widgets/app_bottom_nav.dart';
import '../../../core/widgets/app_error_state.dart';
import '../../home/home_shell.dart';
import '../domain/trip.dart';
import '../domain/trip_enums.dart';
import 'add_place_sheet.dart';
import 'trip_providers.dart';
import 'trip_timeline.dart';

class TripDetailScreen extends ConsumerStatefulWidget {
  const TripDetailScreen({super.key, required this.tripId});

  final String tripId;

  @override
  ConsumerState<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends ConsumerState<TripDetailScreen> {
  int _dayIndex = 0;

  void _openTab(int index) {
    if (index == 1) return;
    ShellTabs.index.value = index;
    context.go(AppRouter.home);
  }

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    final tripState = ref.watch(tripProvider(widget.tripId));

    return Scaffold(
      backgroundColor: palette.surface,
      body: tripState.when(
        loading: () => const SizedBox.shrink(),
        error: (error, _) => AppErrorState(
          message: error.toString(),
          onRetry: () => ref.invalidate(tripProvider(widget.tripId)),
        ),
        data: (trip) {
          final day = trip.days[_dayIndex.clamp(0, trip.days.length - 1)];
          return Stack(
            children: [
              ListView(
                padding: const EdgeInsets.fromLTRB(
                  DesignSpacing.marginMobile,
                  DesignSpacing.spaceXl,
                  DesignSpacing.marginMobile,
                  DesignMetrics.fabAboveDock + DesignMetrics.fab,
                ),
                children: [
                  SafeArea(
                    bottom: false,
                    child: Text(
                      'tripMind',
                      style: DesignType.headlineSm.copyWith(color: palette.onSurface),
                    ),
                  ),
                  const SizedBox(height: DesignSpacing.spaceSm),
                  if (trip.source == TripSource.localDraft)
                    Padding(
                      padding: const EdgeInsets.only(bottom: DesignSpacing.spaceSm),
                      child: Text(
                        'Local draft. Gemini is not connected yet.',
                        style: DesignType.bodySm.copyWith(
                          color: palette.onSurfaceVariant,
                        ),
                      ),
                    ),
                  Text(
                    'AI-Optimized Route',
                    style: DesignType.labelMeta.copyWith(color: DesignColors.secondary),
                  ),
                  Text(
                    trip.title,
                    style: DesignType.headlineMd.copyWith(color: palette.onSurface),
                  ),
                  const SizedBox(height: DesignSpacing.spaceXs),
                  Text(
                    _rangeLabel(trip),
                    style: DesignType.bodySm.copyWith(color: palette.onSurfaceVariant),
                  ),
                  const SizedBox(height: DesignSpacing.spaceMd),
                  SizedBox(
                    height: DesignMetrics.touchTarget + DesignSpacing.spaceSm,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: trip.days.length,
                      separatorBuilder: (_, _) =>
                          const SizedBox(width: DesignSpacing.spaceSm),
                      itemBuilder: (context, index) {
                        final item = trip.days[index];
                        final selected = index == _dayIndex;
                        return _DayTab(
                          day: item,
                          selected: selected,
                          completed: index < _dayIndex,
                          onTap: () => setState(() => _dayIndex = index),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: DesignSpacing.spaceMd),
                  _DaySummary(day: day),
                  const SizedBox(height: DesignSpacing.spaceLg),
                  TripTimeline(stops: day.stops),
                ],
              ),
              Positioned(
                left: DesignSpacing.marginMobile,
                right: DesignSpacing.marginMobile,
                bottom: DesignMetrics.fabAboveDock,
                child: Center(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: DesignColors.ai,
                      borderRadius: BorderRadius.circular(DesignRadius.full),
                      boxShadow: DesignElevation.tier2,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(DesignRadius.full),
                        onTap: () {
                          showAddPlaceSheet(
                            context: context,
                            tripId: trip.id,
                            dayNumber: day.dayNumber,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: DesignSpacing.spaceLg,
                            vertical: DesignSpacing.gutterSm,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.add, color: DesignColors.onPrimary),
                              const SizedBox(width: DesignSpacing.spaceSm),
                              Text(
                                'Add Place or AI Idea',
                                style: DesignType.labelPill.copyWith(
                                  color: DesignColors.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: DesignSpacing.marginMobile,
                right: DesignSpacing.marginMobile,
                bottom: DesignSpacing.marginMobile,
                child: SafeArea(
                  top: false,
                  child: AppBottomNav(
                    currentIndex: 1,
                    onTap: _openTab,
                    destinations: const [
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
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DayTab extends StatelessWidget {
  const _DayTab({
    required this.day,
    required this.selected,
    required this.completed,
    required this.onTap,
  });

  final TripDay day;
  final bool selected;
  final bool completed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    final background = selected ? DesignColors.primary : palette.container;
    final foreground = selected ? DesignColors.onPrimary : palette.onSurfaceVariant;
    return Material(
      color: background,
      borderRadius: BorderRadius.circular(DesignRadius.full),
      child: InkWell(
        borderRadius: BorderRadius.circular(DesignRadius.full),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignSpacing.spaceMd,
            vertical: DesignSpacing.spaceSm,
          ),
          child: Row(
            children: [
              if (completed) ...[
                Icon(Icons.check_circle, color: DesignColors.tertiary, size: DesignType.bodyLg.fontSize),
                const SizedBox(width: DesignSpacing.spaceXs),
              ],
              Text(
                'Day ${day.dayNumber}',
                style: DesignType.labelPill.copyWith(color: foreground),
              ),
              const SizedBox(width: DesignSpacing.spaceXs),
              Text(
                '(${_weekday(day.date)})',
                style: DesignType.labelMeta.copyWith(color: foreground),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DaySummary extends StatelessWidget {
  const _DaySummary({required this.day});

  final TripDay day;

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.lowest,
        borderRadius: BorderRadius.circular(DesignRadius.xl),
        boxShadow: DesignElevation.tier1,
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignSpacing.spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day.weatherLabel,
              style: DesignType.labelMeta.copyWith(color: palette.onSurfaceVariant),
            ),
            const SizedBox(height: DesignSpacing.spaceXs),
            Text(
              day.title,
              style: DesignType.titleCard.copyWith(color: palette.onSurface),
            ),
            const SizedBox(height: DesignSpacing.spaceSm),
            Wrap(
              spacing: DesignSpacing.spaceMd,
              runSpacing: DesignSpacing.spaceXs,
              children: [
                _Stat(icon: Icons.pin_drop_outlined, label: '${day.stops.length} stops'),
                _Stat(icon: Icons.directions_walk, label: day.walkingLabel),
                _Stat(icon: Icons.schedule, label: day.pacingLabel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: DesignColors.primary, size: DesignType.bodyLg.fontSize),
        const SizedBox(width: DesignSpacing.spaceXs),
        Text(
          label,
          style: DesignType.bodySm.copyWith(color: palette.onSurfaceVariant),
        ),
      ],
    );
  }
}

const _weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
const _months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

String _weekday(DateTime date) {
  return '${_weekdays[date.weekday - 1]} ${date.day}';
}

String _rangeLabel(Trip trip) {
  final days = trip.endDate.difference(trip.startDate).inDays + 1;
  return '${_months[trip.startDate.month - 1]} ${trip.startDate.day} – '
      '${_months[trip.endDate.month - 1]} ${trip.endDate.day}, ${trip.endDate.year} · $days days';
}
