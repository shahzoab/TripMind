import 'package:freezed_annotation/freezed_annotation.dart';

import 'trip_enums.dart';

part 'trip.freezed.dart';

@freezed
abstract class TripTransit with _$TripTransit {
  const factory TripTransit({
    required String label,
    String? cost,
  }) = _TripTransit;
}

@freezed
abstract class TripStop with _$TripStop {
  const factory TripStop({
    required String id,
    required String timeLabel,
    required String durationLabel,
    required StopStatus status,
    required String title,
    required String description,
    required CategoryType category,
    String? photoAsset,
    String? bookingReference,
    TripTransit? transitAfter,
  }) = _TripStop;
}

@freezed
abstract class TripDay with _$TripDay {
  const factory TripDay({
    required int dayNumber,
    required DateTime date,
    required String title,
    required String weatherLabel,
    required String walkingLabel,
    required String pacingLabel,
    required List<TripStop> stops,
  }) = _TripDay;
}

@freezed
abstract class Trip with _$Trip {
  const factory Trip({
    required String id,
    required String title,
    required String destination,
    double? destinationLat,
    double? destinationLng,
    required DateTime startDate,
    required DateTime endDate,
    TripStyle? travelStyle,
    required BudgetTier budgetTier,
    required DailyPace dailyPace,
    required TripSource source,
    required List<TripDay> days,
  }) = _Trip;
}
