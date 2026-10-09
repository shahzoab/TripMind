import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/widgets/ai_banner.dart';
import '../../core/widgets/photo_placeholder.dart';
import '../../core/widgets/pill_badge.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.placeName});

  final String placeName;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(placeName)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          const PhotoPlaceholder(
            icon: Icons.auto_awesome_motion,
            height: 200,
            colors: [AppColors.aiAccent, AppColors.primary],
          ),
          const SizedBox(height: 16),
          const Wrap(
            spacing: 8,
            children: [
              PillBadge(label: 'Art'),
              PillBadge(label: 'Open until 22:00', icon: Icons.schedule),
              PillBadge(
                label: '1.2 km from hotel',
                icon: Icons.near_me_outlined,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Walk barefoot through mirrored water rooms and shifting fields of "
            "projected light — one of Tokyo's most immersive digital art spaces.",
            style: TextStyle(color: scheme.onSurfaceVariant),
          ),
          const SizedBox(height: 20),
          const AiBanner(
            label: 'tripMind note',
            message: 'Best after 16:00 so it does not collide with the Tsukiji morning.',
          ),
          const SizedBox(height: 20),
          const Card(
            child: Column(
              children: [
                _InfoRow(
                  icon: Icons.confirmation_number_outlined,
                  label: 'Tickets',
                  value: 'Included in pass',
                ),
                Divider(height: 1),
                _InfoRow(
                  icon: Icons.timer_outlined,
                  label: 'Duration',
                  value: 'About 90 minutes',
                ),
                Divider(height: 1),
                _InfoRow(
                  icon: Icons.home_work_outlined,
                  label: 'Setting',
                  value: 'Indoor, barefoot',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Add to Day 2 at 9:30'),
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton(onPressed: () {}, child: const Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
