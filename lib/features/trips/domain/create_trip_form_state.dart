import 'package:freezed_annotation/freezed_annotation.dart';

import 'trip_enums.dart';

part 'create_trip_form_state.freezed.dart';

@freezed
abstract class CreateTripFormState with _$CreateTripFormState {
  const CreateTripFormState._();

  const factory CreateTripFormState({
    @Default('Kyoto, Japan') String destination,
    @Default(35.0116) double? destinationLat,
    @Default(135.7681) double? destinationLng,
    DateTime? startDate,
    DateTime? endDate,
    TripStyle? travelStyle,
    @Default(BudgetTier.moderate) BudgetTier budgetTier,
    @Default(DailyPace.balanced) DailyPace dailyPace,
  }) = _CreateTripFormState;

  bool get canGenerate {
    return destination.trim().isNotEmpty && startDate != null && endDate != null;
  }

  int get completedSteps {
    var count = 0;
    if (destination.trim().isNotEmpty && startDate != null && endDate != null) {
      count += 1;
    }
    if (travelStyle != null) count += 1;
    count += 1;
    return count;
  }
}

class DestinationSuggestion {
  const DestinationSuggestion({
    required this.label,
    required this.lat,
    required this.lng,
  });

  final String label;
  final double lat;
  final double lng;
}

const destinationSuggestions = <DestinationSuggestion>[
  DestinationSuggestion(label: 'Kyoto, Japan', lat: 35.0116, lng: 135.7681),
  DestinationSuggestion(label: 'Paris, France', lat: 48.8566, lng: 2.3522),
  DestinationSuggestion(label: 'Reykjavik, Iceland', lat: 64.1466, lng: -21.9426),
  DestinationSuggestion(label: 'Amalfi Coast', lat: 40.634, lng: 14.6027),
];
