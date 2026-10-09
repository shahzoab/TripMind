import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/widgets/photo_placeholder.dart';
import '../../core/widgets/pill_badge.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/status_badge.dart';
import '../flights/flights_screen.dart';
import '../trips/trip_overview_screen.dart';
import 'models/home_models.dart';

class HomeHubScreen extends StatefulWidget {
  const HomeHubScreen({super.key});

  @override
  State<HomeHubScreen> createState() => _HomeHubScreenState();
}

class _HomeHubScreenState extends State<HomeHubScreen> {
  final Trip _trip = HomeFixtures.nextDeparture;
  late List<AiInsight> _insights = HomeFixtures.insights();
  late List<TravelMemory> _memories = HomeFixtures.memories();

  Future<void> _refresh() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    setState(() {
      _insights = HomeFixtures.insights();
      _memories = HomeFixtures.memories();
    });
  }

  void _dismissInsight(String id) {
    setState(() => _insights.removeWhere((insight) => insight.id == id));
  }

  void _toggleBookmark(String id) {
    setState(() {
      _insights = [
        for (final insight in _insights)
          if (insight.id == id)
            insight.copyWith(bookmarked: !insight.bookmarked)
          else
            insight,
      ];
    });
  }

  void _hideMemory(String id) {
    setState(() => _memories.removeWhere((memory) => memory.id == id));
  }

  void _openItinerary() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (_) => const TripOverviewScreen()));
  }

  void _openFlights() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (_) => const FlightsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: const _BrandMark(),
        actions: const [
          _NotificationButton(),
          SizedBox(width: 4),
          _UserAvatar(),
          SizedBox(width: 16),
        ],
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: _refresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 128),
          children: [
            Text('Good morning, Sarah ✨', style: text.headlineLarge),
            const SizedBox(height: 4),
            Text('Ready for your next adventure?', style: text.bodyMedium),
            const SizedBox(height: 24),
            Text(
              _trip.departureLabel,
              style: text.labelSmall?.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
            const SizedBox(height: 12),
            _DepartureCard(
              trip: _trip,
              onItinerary: _openItinerary,
              onFlights: _openFlights,
            ),
            const SizedBox(height: 28),
            const SectionHeader(title: 'Smart insights'),
            const SizedBox(height: 12),
            if (_insights.isEmpty)
              Text("You're all caught up.", style: text.bodyMedium)
            else
              for (final insight in _insights) ...[
                _InsightCard(
                  insight: insight,
                  onDismiss: () => _dismissInsight(insight.id),
                  onBookmark: () => _toggleBookmark(insight.id),
                  onAddToDay: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to Day 3')),
                    );
                  },
                ),
                const SizedBox(height: 12),
              ],
            const SizedBox(height: 16),
            SectionHeader(
              title: 'Travel memories',
              trailingLabel: 'View all (6)',
              onTrailingTap: () {},
            ),
            const SizedBox(height: 4),
            for (final memory in _memories)
              _MemoryTile(memory: memory, onHide: () => _hideMemory(memory.id)),
          ],
        ),
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: AppGradients.ai,
          ),
          child: const Icon(
            Icons.travel_explore,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'tripMind',
          style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Notifications',
      onPressed: () {},
      icon: const Badge(
        backgroundColor: AppColors.danger,
        smallSize: 8,
        child: Icon(Icons.notifications_outlined),
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar();

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 18,
      backgroundColor: AppColors.primary,
      child: Text(
        'S',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _DepartureCard extends StatelessWidget {
  const _DepartureCard({
    required this.trip,
    required this.onItinerary,
    required this.onFlights,
  });

  final Trip trip;
  final VoidCallback onItinerary;
  final VoidCallback onFlights;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return _SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const PhotoPlaceholder(
                icon: Icons.location_city_outlined,
                height: 176,
                borderRadius: 0,
                darkOverlay: true,
                image: AssetImage('assets/images/tokyo.jpg'),
                colors: [Color(0xFF1B3A4B), Color(0xFF007AFF)],
              ),
              Positioned(
                top: 12,
                left: 12,
                child: PillBadge(
                  label: trip.countdownLabel,
                  backgroundColor: const Color(0xEBFFFFFF),
                  foregroundColor: AppColors.textPrimary,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: StatusBadge(kind: trip.status),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(trip.title, style: text.headlineSmall),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: Text(trip.dateRange, style: text.bodySmall),
                    ),
                    const _AvatarCluster(
                      colors: [
                        Color(0xFF007AFF),
                        Color(0xFF0D9488),
                        Color(0xFFFF9500),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(trip.progressLabel, style: text.labelSmall),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: LinearProgressIndicator(
                    value: trip.progress,
                    minHeight: 6,
                    color: AppColors.primary,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.12),
                  ),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary.withValues(
                          alpha: 0.1,
                        ),
                        foregroundColor: AppColors.primary,
                        minimumSize: const Size(0, 44),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadii.button),
                        ),
                      ),
                      onPressed: onItinerary,
                      child: const Text('View Itinerary'),
                    ),
                    ActionChip(
                      avatar: const Icon(Icons.flight, size: 18),
                      label: Text(trip.flightChip),
                      onPressed: onFlights,
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

class _InsightCard extends StatelessWidget {
  const _InsightCard({
    required this.insight,
    required this.onDismiss,
    required this.onBookmark,
    required this.onAddToDay,
  });

  final AiInsight insight;
  final VoidCallback onDismiss;
  final VoidCallback onBookmark;
  final VoidCallback onAddToDay;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final isAlert = insight.kind == AiInsightKind.alert;
    return _SurfaceCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: isAlert
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.campaign_outlined,
                        size: 18,
                        color: AppColors.warning,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'BOOKING ALERT',
                        style: text.labelSmall?.copyWith(
                          color: AppColors.warning,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    insight.message,
                    style: text.bodyMedium?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      TextButton(
                        onPressed: onDismiss,
                        child: const Text('Dismiss'),
                      ),
                      FilledButton.tonal(
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(0, 40),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: onAddToDay,
                        child: const Text('Add to Day 3 +'),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.park_outlined, color: AppColors.aiAccent),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          insight.title ?? 'Recommendation',
                          style: text.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(insight.message, style: text.bodyMedium),
                      ],
                    ),
                  ),
                  IconButton(
                    tooltip: insight.bookmarked
                        ? 'Remove bookmark'
                        : 'Bookmark',
                    onPressed: onBookmark,
                    icon: Icon(
                      insight.bookmarked
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: insight.bookmarked
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _MemoryTile extends StatelessWidget {
  const _MemoryTile({required this.memory, required this.onHide});

  final TravelMemory memory;
  final VoidCallback onHide;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: _SurfaceCard(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
          child: Row(
            children: [
              PhotoPlaceholder(
                icon: Icons.photo_outlined,
                height: 56,
                width: 56,
                borderRadius: 12,
                colors: memory.colors,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(memory.title, style: text.titleMedium),
                    const SizedBox(height: 2),
                    Text(memory.duration, style: text.labelSmall),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                tooltip: 'More',
                onSelected: (value) {
                  if (value == 'hide') onHide();
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(value: 'share', child: Text('Share')),
                  PopupMenuItem(value: 'hide', child: Text('Hide')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarCluster extends StatelessWidget {
  const _AvatarCluster({required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    const diameter = 26.0;
    const step = 16.0;
    return SizedBox(
      width: diameter + step * (colors.length - 1),
      height: diameter,
      child: Stack(
        children: [
          for (var i = 0; i < colors.length; i++)
            Positioned(
              left: i * step,
              child: Container(
                width: diameter,
                height: diameter,
                decoration: BoxDecoration(
                  color: colors[i],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SurfaceCard extends StatelessWidget {
  const _SurfaceCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.card,
        borderRadius: BorderRadius.circular(AppRadii.card),
        border: Border.all(
          color: isDark ? AppColors.hairlineDark : AppColors.hairline,
        ),
        boxShadow: AppShadows.soft,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadii.card),
        child: child,
      ),
    );
  }
}
