import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/itinerary_repository.dart';
import '../domain/create_trip_form_state.dart';
import '../domain/trip.dart';
import '../domain/trip_enums.dart';

final createTripFormProvider =
    NotifierProvider<CreateTripForm, CreateTripFormState>(CreateTripForm.new);

class CreateTripForm extends Notifier<CreateTripFormState> {
  @override
  CreateTripFormState build() => const CreateTripFormState();

  void setDestination(String value) {
    final match = destinationSuggestions.where((item) => item.label == value);
    state = state.copyWith(
      destination: value,
      destinationLat: match.isEmpty ? null : match.first.lat,
      destinationLng: match.isEmpty ? null : match.first.lng,
    );
  }

  void setDates(DateTime start, DateTime end) {
    state = state.copyWith(startDate: start, endDate: end);
  }

  void setTravelStyle(TripStyle style) {
    state = state.copyWith(travelStyle: style);
  }

  void setBudgetTier(BudgetTier tier) {
    state = state.copyWith(budgetTier: tier);
  }

  void setDailyPace(DailyPace pace) {
    state = state.copyWith(dailyPace: pace);
  }
}

final generationProvider = FutureProvider.autoDispose<String>((ref) {
  final form = ref.read(createTripFormProvider);
  return ref.read(itineraryRepositoryProvider.notifier).generate(form);
});

final tripProvider = Provider.family<AsyncValue<Trip>, String>((ref, id) {
  final trip = ref.watch(itineraryRepositoryProvider)[id];
  if (trip == null) {
    return AsyncValue.error(
      StateError('That trip is not on this device.'),
      StackTrace.current,
    );
  }
  return AsyncValue.data(trip);
});

final suggestionProvider = FutureProvider.autoDispose.family<TripStop, String>((
  ref,
  tripId,
) {
  return ref.read(itineraryRepositoryProvider.notifier).suggest(tripId);
});
