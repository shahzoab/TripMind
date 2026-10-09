import 'package:flutter/material.dart';

import '../../../core/design/design_tokens.dart';
import '../../../core/widgets/status_dot.dart';
import '../domain/trip.dart';
import '../domain/trip_enums.dart';

class TripTimeline extends StatelessWidget {
  const TripTimeline({super.key, required this.stops});

  final List<TripStop> stops;

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    return Stack(
      children: [
        Positioned(
          left: DesignMetrics.spineOffset - (DesignMetrics.spine / 2),
          top: 0,
          bottom: 0,
          child: SizedBox(
            width: DesignMetrics.spine,
            child: ColoredBox(color: palette.spine),
          ),
        ),
        Column(
          children: [
            for (final stop in stops) ...[
              _StopRow(stop: stop),
              if (stop.transitAfter != null)
                _TransitRow(transit: stop.transitAfter!),
            ],
          ],
        ),
      ],
    );
  }
}

class _StopRow extends StatelessWidget {
  const _StopRow({required this.stop});

  final TripStop stop;

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: DesignSpacing.spaceLg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: DesignMetrics.spineOffset - (DesignMetrics.node / 2),
          ),
          _CategoryNode(category: stop.category),
          const SizedBox(width: DesignSpacing.spaceMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      stop.timeLabel,
                      style: DesignType.labelMeta.copyWith(
                        color: DesignColors.primary,
                      ),
                    ),
                    const SizedBox(width: DesignSpacing.spaceSm),
                    Text(
                      stop.durationLabel,
                      style: DesignType.labelMeta.copyWith(
                        color: palette.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: DesignSpacing.spaceXs),
                Row(
                  children: [
                    StatusDot(color: _statusColor(stop.status)),
                    const SizedBox(width: DesignSpacing.spaceXs),
                    Text(
                      stop.status.title,
                      style: DesignType.labelMeta.copyWith(
                        color: palette.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: DesignSpacing.spaceXs),
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
                if (stop.photoAsset != null) ...[
                  const SizedBox(height: DesignSpacing.spaceSm),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(DesignRadius.lg),
                    child: Image.asset(
                      stop.photoAsset!,
                      height: DesignMetrics.fab + DesignSpacing.spaceXl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
                const SizedBox(height: DesignSpacing.spaceSm),
                Text(
                  stop.category.title,
                  style: DesignType.labelPill.copyWith(
                    color: palette.onSurfaceVariant,
                  ),
                ),
                if (stop.bookingReference != null) ...[
                  const SizedBox(height: DesignSpacing.spaceSm),
                  Row(
                    children: [
                      const Icon(
                        Icons.confirmation_number_outlined,
                        color: DesignColors.primary,
                      ),
                      const SizedBox(width: DesignSpacing.spaceSm),
                      Text(
                        'Booking',
                        style: DesignType.labelMeta.copyWith(
                          color: palette.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(width: DesignSpacing.spaceSm),
                      Text(
                        stop.bookingReference!,
                        style: DesignType.labelCode.copyWith(
                          color: palette.onSurface,
                          fontSize: DesignType.bodyMd.fontSize,
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: DesignSpacing.spaceSm),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.directions, color: palette.onSurfaceVariant),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark_border,
                        color: palette.onSurfaceVariant,
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

class _TransitRow extends StatelessWidget {
  const _TransitRow({required this.transit});

  final TripTransit transit;

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    final indent =
        DesignMetrics.spineOffset -
        (DesignMetrics.node / 2) +
        DesignMetrics.node +
        DesignSpacing.spaceMd;
    return Padding(
      padding: EdgeInsets.only(
        left: indent,
        bottom: DesignSpacing.spaceLg,
      ),
      child: Row(
        children: [
          Icon(Icons.directions_walk, color: palette.onSurfaceVariant),
          const SizedBox(width: DesignSpacing.spaceSm),
          Expanded(
            child: Text(
              transit.label,
              style: DesignType.bodySm.copyWith(color: palette.onSurface),
            ),
          ),
          if (transit.cost != null)
            Text(
              transit.cost!,
              style: DesignType.labelMeta.copyWith(color: palette.outline),
            ),
        ],
      ),
    );
  }
}

class _CategoryNode extends StatelessWidget {
  const _CategoryNode({required this.category});

  final CategoryType category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DesignMetrics.node,
      height: DesignMetrics.node,
      decoration: const BoxDecoration(
        color: DesignColors.primary,
        shape: BoxShape.circle,
      ),
      child: Icon(_icon(category), color: DesignColors.onPrimary, size: DesignType.headlineSm.fontSize),
    );
  }
}

IconData _icon(CategoryType category) {
  return switch (category) {
    CategoryType.temple => Icons.account_balance,
    CategoryType.cafe => Icons.coffee,
    CategoryType.dining => Icons.restaurant,
    CategoryType.shopping => Icons.shopping_bag_outlined,
    CategoryType.cruise => Icons.directions_boat_outlined,
    CategoryType.transit => Icons.subway,
    CategoryType.activity => Icons.explore_outlined,
    CategoryType.hotel => Icons.hotel,
    CategoryType.flight => Icons.flight,
  };
}

Color _statusColor(StopStatus status) {
  return switch (status) {
    StopStatus.confirmed => DesignColors.success,
    StopStatus.reserved => DesignColors.tertiary,
    StopStatus.ticketReady => DesignColors.primaryAction,
    StopStatus.suggested => DesignColors.warning,
  };
}
