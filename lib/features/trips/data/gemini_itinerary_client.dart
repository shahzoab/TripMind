import '../domain/create_trip_form_state.dart';
import '../domain/trip.dart';

/// Thrown until Firebase AI Logic is initialised in `main.dart`.
class GeminiUnavailable implements Exception {
  const GeminiUnavailable(this.message);

  final String message;

  @override
  String toString() => message;
}

/// Client boundary for Gemini. The running app has no Firebase app, so both
/// calls fail here. The repository turns a failed generate into a local draft.
class GeminiItineraryClient {
  const GeminiItineraryClient();

  Future<Trip> generate(CreateTripFormState form) async {
    throw const GeminiUnavailable(
      'Firebase AI Logic is not initialised, so Gemini was not called.',
    );
  }

  Future<TripStop> suggest(Trip trip) async {
    throw const GeminiUnavailable(
      'Firebase AI Logic is not initialised, so Gemini was not called.',
    );
  }
}
