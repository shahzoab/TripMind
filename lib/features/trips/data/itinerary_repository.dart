import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/create_trip_form_state.dart';
import '../domain/trip.dart';
import '../domain/trip_enums.dart';
import 'gemini_itinerary_client.dart';

final itineraryRepositoryProvider =
    NotifierProvider<ItineraryRepository, Map<String, Trip>>(
      ItineraryRepository.new,
    );

class ItineraryRepository extends Notifier<Map<String, Trip>> {
  final GeminiItineraryClient _gemini = const GeminiItineraryClient();

  @override
  Map<String, Trip> build() => const {};

  Future<String> generate(CreateTripFormState form) async {
    if (!form.canGenerate) {
      throw StateError('Destination and dates are required.');
    }
    await Future<void>.delayed(const Duration(milliseconds: 1600));
    Trip trip;
    try {
      trip = await _gemini.generate(form);
    } on GeminiUnavailable {
      trip = _draft(form);
    }
    state = {...state, trip.id: trip};
    return trip.id;
  }

  Future<TripStop> suggest(String tripId) {
    final trip = state[tripId];
    if (trip == null) {
      throw StateError('That trip is not on this device.');
    }
    return _gemini.suggest(trip);
  }

  void addStop(String tripId, int dayNumber, TripStop stop) {
    final trip = state[tripId];
    if (trip == null) return;
    final days = [
      for (final day in trip.days)
        if (day.dayNumber == dayNumber)
          day.copyWith(stops: [...day.stops, stop])
        else
          day,
    ];
    state = {...state, tripId: trip.copyWith(days: days)};
  }
}

Trip _draft(CreateTripFormState form) {
  final start = form.startDate!;
  final end = form.endDate!;
  final rawDays = end.difference(start).inDays + 1;
  final dayCount = rawDays.clamp(1, 8);
  final perDay = form.dailyPace.stopsPerDay;
  final destination = form.destination.trim();
  final id = 'trip-${start.millisecondsSinceEpoch}-${destination.hashCode}';

  return Trip(
    id: id,
    title: '$destination Discovery',
    destination: destination,
    destinationLat: form.destinationLat,
    destinationLng: form.destinationLng,
    startDate: start,
    endDate: end,
    travelStyle: form.travelStyle,
    budgetTier: form.budgetTier,
    dailyPace: form.dailyPace,
    source: TripSource.localDraft,
    days: [
      for (var index = 0; index < dayCount; index++)
        _day(
          destination: destination,
          style: form.travelStyle,
          date: start.add(Duration(days: index)),
          dayNumber: index + 1,
          stopCount: perDay,
        ),
    ],
  );
}

TripDay _day({
  required String destination,
  required TripStyle? style,
  required DateTime date,
  required int dayNumber,
  required int stopCount,
}) {
  final focus = switch (style) {
    TripStyle.foodie => 'Markets and kitchens in $destination',
    TripStyle.culture => 'Temples and old streets in $destination',
    TripStyle.nature => 'Parks and walks in $destination',
    TripStyle.cafes => 'Cafes and quiet blocks in $destination',
    TripStyle.highEnergy => 'A full circuit of $destination',
    TripStyle.slowTravel => 'A slow morning in $destination',
    null => 'A first pass through $destination',
  };
  final templates = _templates(destination, style);
  final stops = <TripStop>[
    for (var index = 0; index < stopCount; index++)
      templates[index % templates.length].copyWith(
        id: 'd$dayNumber-s$index',
        timeLabel: _times[index % _times.length],
      ),
  ];
  if (stops.length > 1) {
    final first = stops.first;
    stops[0] = first.copyWith(
      transitAfter: TripTransit(
        label: 'Walk · 8 min toward the next stop',
        cost: null,
      ),
    );
  }
  return TripDay(
    dayNumber: dayNumber,
    date: date,
    title: focus,
    weatherLabel: 'Clear · 19°C',
    walkingLabel: '${(stopCount * 1.1).toStringAsFixed(1)} km walking',
    pacingLabel: '~${stopCount + 2} hrs pacing',
    stops: stops,
  );
}

const _times = ['08:30 AM', '10:45 AM', '12:30 PM', '02:30 PM', '06:00 PM'];

List<TripStop> _templates(String destination, TripStyle? style) {
  final lead = switch (style) {
    TripStyle.foodie => CategoryType.dining,
    TripStyle.cafes => CategoryType.cafe,
    TripStyle.nature => CategoryType.activity,
    _ => CategoryType.temple,
  };
  return [
    TripStop(
      id: 'temple',
      timeLabel: '08:30 AM',
      durationLabel: '1.5 hrs',
      status: StopStatus.confirmed,
      title: 'Morning landmark in $destination',
      description:
          'Start before the crowds. A quiet first hour for the main gate and the streets around it.',
      category: lead,
      photoAsset: 'assets/images/tokyo_spring_hero.jpg',
      transitAfter: const TripTransit(label: '4 min walk from the west gate'),
    ),
    const TripStop(
      id: 'cafe',
      timeLabel: '10:45 AM',
      durationLabel: '45 min',
      status: StopStatus.suggested,
      title: 'Neighborhood coffee',
      description:
          'A short sit-down between the morning site and the midday table.',
      category: CategoryType.cafe,
    ),
    TripStop(
      id: 'dining',
      timeLabel: '12:30 PM',
      durationLabel: '1 hr 15 min',
      status: StopStatus.reserved,
      title: 'Table in $destination',
      description: 'A reserved midday meal, paced for the budget you picked.',
      category: CategoryType.dining,
      bookingReference: 'TM-2048',
    ),
    TripStop(
      id: 'shopping',
      timeLabel: '02:30 PM',
      durationLabel: '2.0 hrs',
      status: StopStatus.suggested,
      title: 'Afternoon district',
      description: 'Side streets, shops, and one flexible block if the day runs long.',
      category: CategoryType.shopping,
      photoAsset: 'assets/images/teamlab_thumb.jpg',
    ),
    const TripStop(
      id: 'cruise',
      timeLabel: '06:00 PM',
      durationLabel: 'Golden hour',
      status: StopStatus.ticketReady,
      title: 'Evening water or view',
      description: 'Close the day somewhere you can watch the light change.',
      category: CategoryType.cruise,
      photoAsset: 'assets/images/tokyo.jpg',
      bookingReference: 'TM-CR-19',
    ),
  ];
}
