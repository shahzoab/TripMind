import 'package:flutter/material.dart';

import '../../../core/widgets/status_badge.dart';

/// The next trip shown on the home hub.
class Trip {
  const Trip({
    required this.title,
    required this.dateRange,
    required this.departureLabel,
    required this.countdownLabel,
    required this.status,
    required this.daysPlanned,
    required this.totalDays,
    required this.flightChip,
  });

  final String title;
  final String dateRange;
  final String departureLabel;
  final String countdownLabel;
  final StatusBadgeKind status;
  final int daysPlanned;
  final int totalDays;
  final String flightChip;

  double get progress => totalDays == 0 ? 0 : daysPlanned / totalDays;

  String get progressLabel {
    final percent = (progress * 100).round();
    return 'Itinerary Build — $daysPlanned of $totalDays days planned ($percent%)';
  }
}

enum AiInsightKind { alert, recommendation }

/// A contextual suggestion the home hub can dismiss or bookmark.
class AiInsight {
  const AiInsight({
    required this.id,
    required this.kind,
    required this.message,
    this.title,
    this.bookmarked = false,
  });

  final String id;
  final AiInsightKind kind;
  final String message;
  final String? title;
  final bool bookmarked;

  AiInsight copyWith({bool? bookmarked}) {
    return AiInsight(
      id: id,
      kind: kind,
      message: message,
      title: title,
      bookmarked: bookmarked ?? this.bookmarked,
    );
  }
}

/// A past trip shown in the memories list.
class TravelMemory {
  const TravelMemory({
    required this.id,
    required this.title,
    required this.duration,
    required this.colors,
  });

  final String id;
  final String title;
  final String duration;
  final List<Color> colors;
}

/// Dummy home-hub data. Each call returns fresh lists so refresh can reset UI state.
class HomeFixtures {
  HomeFixtures._();

  static const Trip nextDeparture = Trip(
    title: 'Tokyo Autumn Discovery',
    dateRange: 'Oct 14 – Oct 22 • 8 days',
    departureLabel: 'NEXT DEPARTURE • T-minus 12 days',
    countdownLabel: 'In 12 days',
    status: StatusBadgeKind.confirmed,
    daysPlanned: 6,
    totalDays: 8,
    flightChip: 'Flights (HND)',
  );

  static List<AiInsight> insights() {
    return const [
      AiInsight(
        id: 'teamlab',
        kind: AiInsightKind.alert,
        message: 'Book teamLab Planets early — slots selling fast',
      ),
      AiInsight(
        id: 'gyoen',
        kind: AiInsightKind.recommendation,
        title: 'Maple foliage peak',
        message: 'Shinjuku Gyoen is at peak color — a quiet hour fits Day 4.',
      ),
    ];
  }

  static List<TravelMemory> memories() {
    return const [
      TravelMemory(
        id: 'amalfi',
        title: 'Amalfi Coast & Rome',
        duration: '7 days',
        colors: [Color(0xFF007AFF), Color(0xFF5AC8FA)],
      ),
      TravelMemory(
        id: 'reykjavik',
        title: 'Reykjavik Northern Lights',
        duration: '5 days',
        colors: [Color(0xFF0D9488), Color(0xFF0B1D36)],
      ),
    ];
  }
}
