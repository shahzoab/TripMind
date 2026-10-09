import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design/design_tokens.dart';
import '../../../core/widgets/app_divider.dart';
import '../../../core/widgets/app_error_state.dart';
import '../data/itinerary_repository.dart';
import '../domain/trip.dart';
import '../domain/trip_enums.dart';
import 'trip_providers.dart';

Future<void> showAddPlaceSheet({
  required BuildContext context,
  required String tripId,
  required int dayNumber,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: DesignPalette.of(context).surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(DesignRadius.xl)),
    ),
    builder: (context) {
      return _AddPlaceSheet(tripId: tripId, dayNumber: dayNumber);
    },
  );
}

class _AddPlaceSheet extends ConsumerStatefulWidget {
  const _AddPlaceSheet({required this.tripId, required this.dayNumber});

  final String tripId;
  final int dayNumber;

  @override
  ConsumerState<_AddPlaceSheet> createState() => _AddPlaceSheetState();
}

class _AddPlaceSheetState extends ConsumerState<_AddPlaceSheet> {
  final TextEditingController _search = TextEditingController();
  var _mode = _AddMode.choose;

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  void _addSearch() {
    final name = _search.text.trim();
    if (name.isEmpty) return;
    ref.read(itineraryRepositoryProvider.notifier).addStop(
      widget.tripId,
      widget.dayNumber,
      TripStop(
        id: 'search-${name.hashCode}',
        timeLabel: 'Open',
        durationLabel: 'Unscheduled',
        status: StopStatus.suggested,
        title: name,
        description: 'Added from search. Time is still open.',
        category: CategoryType.activity,
      ),
    );
    Navigator.of(context).pop();
  }

  void _confirm(TripStop stop) {
    ref.read(itineraryRepositoryProvider.notifier).addStop(
      widget.tripId,
      widget.dayNumber,
      stop,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    final suggestion = _mode == _AddMode.ask
        ? ref.watch(suggestionProvider(widget.tripId))
        : null;

    return Padding(
      padding: EdgeInsets.only(
        left: DesignSpacing.marginMobile,
        right: DesignSpacing.marginMobile,
        top: DesignSpacing.spaceMd,
        bottom: MediaQuery.viewInsetsOf(context).bottom + DesignSpacing.spaceLg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: DesignMetrics.node + DesignSpacing.spaceXs,
              height: DesignSpacing.spaceXs,
              decoration: BoxDecoration(
                color: palette.outline,
                borderRadius: BorderRadius.circular(DesignRadius.full),
              ),
            ),
          ),
          const SizedBox(height: DesignSpacing.spaceMd),
          Text(
            'Add a place',
            style: DesignType.headlineSm.copyWith(color: palette.onSurface),
          ),
          const SizedBox(height: DesignSpacing.spaceMd),
          if (_mode == _AddMode.choose) ...[
            _Option(
              icon: Icons.search,
              label: 'Search a place',
              onTap: () => setState(() => _mode = _AddMode.search),
            ),
            const AppDivider(),
            _Option(
              icon: Icons.auto_awesome,
              label: 'Ask AI to suggest',
              onTap: () => setState(() => _mode = _AddMode.ask),
            ),
          ],
          if (_mode == _AddMode.search) ...[
            TextField(
              controller: _search,
              autofocus: true,
              style: DesignType.bodyMd.copyWith(color: palette.onSurface),
              decoration: InputDecoration(
                hintText: 'Search a place',
                hintStyle: DesignType.bodyMd.copyWith(color: palette.outline),
              ),
              onSubmitted: (_) => _addSearch(),
            ),
            const SizedBox(height: DesignSpacing.spaceMd),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _addSearch,
                child: Text(
                  'Add',
                  style: DesignType.titleCard.copyWith(color: DesignColors.primary),
                ),
              ),
            ),
          ],
          if (suggestion != null)
            suggestion.when(
              loading: () => Padding(
                padding: const EdgeInsets.symmetric(vertical: DesignSpacing.spaceLg),
                child: Text(
                  'Asking for one stop',
                  style: DesignType.headlineSm.copyWith(color: palette.onSurface),
                ),
              ),
              error: (error, _) => AppErrorState(
                message: error.toString(),
                onRetry: () => ref.invalidate(suggestionProvider(widget.tripId)),
              ),
              data: (stop) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stop.title,
                    style: DesignType.titleCard.copyWith(color: palette.onSurface),
                  ),
                  const SizedBox(height: DesignSpacing.spaceXs),
                  Text(
                    stop.description,
                    style: DesignType.bodySm.copyWith(
                      color: palette.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: DesignSpacing.spaceMd),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'Dismiss',
                          style: DesignType.titleCard.copyWith(
                            color: palette.onSurfaceVariant,
                          ),
                        ),
                      ),
                      const SizedBox(width: DesignSpacing.spaceSm),
                      TextButton(
                        onPressed: () => _confirm(stop),
                        child: Text(
                          'Confirm',
                          style: DesignType.titleCard.copyWith(
                            color: DesignColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

enum _AddMode { choose, search, ask }

class _Option extends StatelessWidget {
  const _Option({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    return InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: DesignMetrics.touchTarget),
        child: Row(
          children: [
            Icon(icon, color: DesignColors.primary),
            const SizedBox(width: DesignSpacing.spaceSm),
            Text(label, style: DesignType.bodyLg.copyWith(color: palette.onSurface)),
          ],
        ),
      ),
    );
  }
}
