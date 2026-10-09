import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Local stand-in for a signed-in session.
///
/// Google Sign-In is not configured. Welcome sets this so `/create` and
/// `/trip/:tripId` can be auth-guarded without a Firebase user.
final authSessionProvider = NotifierProvider<AuthSession, bool>(AuthSession.new);

class AuthSession extends Notifier<bool> {
  @override
  bool build() => false;

  void enter() => state = true;
}
