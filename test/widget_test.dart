import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tripmind/app/app_theme.dart';
import 'package:tripmind/features/profile/profile_screen.dart';
import 'package:tripmind/features/trips/itinerary_day_screen.dart';
import 'package:tripmind/features/trips/trip_overview_screen.dart';
import 'package:tripmind/main.dart';

void main() {
  Future<void> usePhoneSurface(WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  testWidgets('Welcome screen shows the wordmark and primary button', (
    WidgetTester tester,
  ) async {
    await usePhoneSurface(tester);
    await tester.pumpWidget(const TripMindApp());
    await tester.pump();

    expect(find.text('tripMind'), findsOneWidget);
    expect(find.text('Honshu Golden Route'), findsOneWidget);
    expect(find.textContaining('Effortless travel'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });

  testWidgets('Get Started navigates into the home shell with bottom nav', (
    WidgetTester tester,
  ) async {
    await usePhoneSurface(tester);
    await tester.pumpWidget(const TripMindApp());
    await tester.pump();

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    expect(find.text('tripMind'), findsOneWidget);
    expect(find.text('Good morning, Sarah ✨'), findsOneWidget);
    expect(find.text('Tokyo Autumn Discovery'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Itinerary'), findsOneWidget);
    expect(find.text('Flights'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });

  testWidgets('Itinerary tab opens the Tokyo trip overview', (
    WidgetTester tester,
  ) async {
    await usePhoneSurface(tester);
    await tester.pumpWidget(const TripMindApp());
    await tester.pump();
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Itinerary'));
    await tester.pumpAndSettle();

    expect(find.text('Tokyo in Spring'), findsOneWidget);
    expect(find.textContaining('Confirmed'), findsOneWidget);
    expect(find.text('8 days'), findsOneWidget);

    final overviewScroll = find.descendant(
      of: find.byType(TripOverviewScreen),
      matching: find.byWidgetPredicate(
        (widget) =>
            widget is Scrollable && widget.axisDirection == AxisDirection.down,
      ),
    );
    await tester.scrollUntilVisible(
      find.text('NEXT UP TODAY'),
      300,
      scrollable: overviewScroll,
    );
    expect(find.text('NEXT UP TODAY'), findsOneWidget);
  });

  testWidgets('Selecting Day 1 opens that day plan', (tester) async {
    await usePhoneSurface(tester);
    await tester.pumpWidget(const TripMindApp());
    await tester.pump();
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Itinerary'));
    await tester.pumpAndSettle();

    final overviewScroll = find.descendant(
      of: find.byType(TripOverviewScreen),
      matching: find.byWidgetPredicate(
        (widget) =>
            widget is Scrollable && widget.axisDirection == AxisDirection.down,
      ),
    );
    await tester.scrollUntilVisible(
      find.text('Day 1'),
      200,
      scrollable: overviewScroll,
    );
    await tester.tap(find.text('Day 1'));
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.text('Open day plan'),
      200,
      scrollable: overviewScroll,
    );
    await tester.tap(find.text('Open day plan'));
    await tester.pumpAndSettle();

    expect(find.text('Shibuya arrival & Meiji quiet'), findsOneWidget);
  });

  testWidgets('Day 2 timeline lists Asakusa stops and can switch views', (
    tester,
  ) async {
    await usePhoneSurface(tester);
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: const ItineraryDayScreen(day: 2),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Tokyo Autumn Discovery'), findsOneWidget);
    expect(
      find.text('Traditional Asakusa & Futuristic Akihabara'),
      findsOneWidget,
    );
    expect(find.text('Senso-ji Temple & Nakamise Dori'), findsOneWidget);
    expect(find.text('Add Place or AI Idea'), findsOneWidget);
    expect(find.text('Itinerary'), findsOneWidget);

    await tester.tap(find.widgetWithText(ChoiceChip, 'Day 1 (Mon 14)'));
    await tester.pumpAndSettle();
    expect(find.text('Shibuya arrival & Meiji quiet'), findsOneWidget);
    expect(find.text('Senso-ji Temple & Nakamise Dori'), findsNothing);

    await tester.tap(find.widgetWithText(ChoiceChip, 'Day 2 (Tue 15)'));
    await tester.pumpAndSettle();

    final timeline = find.descendant(
      of: find.byType(ItineraryDayScreen),
      matching: find.byWidgetPredicate(
        (widget) =>
            widget is Scrollable && widget.axisDirection == AxisDirection.down,
      ),
    );
    await tester.scrollUntilVisible(
      find.textContaining('Tsukuba Express'),
      400,
      scrollable: timeline,
    );
    expect(find.text('Akihabara Electric Town & Mandarake'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Sumida River Sunset Cruise'),
      400,
      scrollable: timeline,
    );

    await tester.tap(find.byTooltip('Map'));
    await tester.pumpAndSettle();
    expect(find.byTooltip('Timeline'), findsOneWidget);
    expect(find.text('Senso-ji Temple & Nakamise Dori'), findsOneWidget);
  });

  testWidgets('Profile tab shows Maya and the unhurried setting', (
    tester,
  ) async {
    await usePhoneSurface(tester);
    await tester.pumpWidget(const TripMindApp());
    await tester.pump();
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();

    expect(find.text('Maya Chen'), findsOneWidget);
    expect(find.text('Lisbon, Portugal 🇵🇹'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('14'), findsOneWidget);
    expect(find.text('Window seat'), findsOneWidget);
    expect(find.text('Thoughtful Explorer'), findsOneWidget);
    expect(find.text('Suggest unhurried trips'), findsOneWidget);
    expect(find.textContaining('45-minute pacing buffer'), findsOneWidget);

    await tester.ensureVisible(find.byType(Switch));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(Switch));
    await tester.pump();
    expect(find.text('Pacing buffer is off.'), findsOneWidget);

    final profileScroll = find.descendant(
      of: find.byType(ProfileScreen),
      matching: find.byWidgetPredicate(
        (widget) =>
            widget is Scrollable && widget.axisDirection == AxisDirection.down,
      ),
    );
    await tester.scrollUntilVisible(
      find.text('Kyoto, Japan'),
      200,
      scrollable: profileScroll,
    );
    expect(find.text('Kyoto, Japan'), findsOneWidget);
    expect(find.textContaining("Spring '25"), findsOneWidget);
    expect(find.text('Slow pace'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Sign out'),
      200,
      scrollable: profileScroll,
    );
    expect(find.text('Currency'), findsOneWidget);
    expect(find.text('USD'), findsOneWidget);
    expect(find.text('Sign out'), findsOneWidget);
  });
}
