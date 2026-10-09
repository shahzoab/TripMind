import 'package:flutter/material.dart';

import '../../core/widgets/ai_banner.dart';
import '../../core/widgets/photo_placeholder.dart';
import '../../core/widgets/pill_badge.dart';
import '../../core/widgets/section_header.dart';
import 'place_detail_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  static const List<_Place> _places = [
    _Place(
      name: 'teamLab Planets',
      category: 'Art & Digital',
      meta: '1.2 km • 1.5–2 hrs',
      icon: Icons.auto_awesome_motion,
    ),
    _Place(
      name: 'Tsukiji Outer Market',
      category: 'Food & Dining',
      meta: 'Best in morning • 3.4 km',
      icon: Icons.restaurant_outlined,
    ),
    _Place(
      name: 'Meiji Shrine & Forest',
      category: 'Quiet & Nature',
      meta: 'Quiet retreat • 25 min',
      icon: Icons.park_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Explore')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Search places, food, neighborhoods',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 16),
          const AiBanner(
            label: 'AI insight',
            message: 'Near your hotel tomorrow morning: Fuglen Coffee Asakusa or a Sumida River walk.',
          ),
          const SizedBox(height: 24),
          const SectionHeader(title: 'For Tokyo'),
          const SizedBox(height: 12),
          for (final place in _places) ...[
            Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PlaceDetailScreen(placeName: place.name),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          width: 64,
                          height: 64,
                          color: scheme.primaryContainer,
                          child: Icon(
                            place.icon,
                            color: scheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PillBadge(label: place.category),
                            const SizedBox(height: 6),
                            Text(
                              place.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              place.meta,
                              style: TextStyle(
                                fontSize: 12,
                                color: scheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
          const SizedBox(height: 12),
          const SectionHeader(title: 'Saved'),
          const SizedBox(height: 12),
          const _SavedRow(
            title: 'Nezu Museum & Garden',
            subtitle: 'Aoyama • Japanese art',
          ),
          const SizedBox(height: 8),
          const _SavedRow(
            title: 'Omoide Yokocho',
            subtitle: 'Shinjuku • Yakitori alleys',
          ),
        ],
      ),
    );
  }
}

class _Place {
  const _Place({
    required this.name,
    required this.category,
    required this.meta,
    required this.icon,
  });

  final String name;
  final String category;
  final String meta;
  final IconData icon;
}

class _SavedRow extends StatelessWidget {
  const _SavedRow({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const SizedBox(
          width: 44,
          height: 44,
          child: PhotoPlaceholder(
            icon: Icons.place_outlined,
            height: 44,
            borderRadius: 10,
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
