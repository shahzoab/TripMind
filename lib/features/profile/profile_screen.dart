import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/widgets/pill_badge.dart';
import '../../core/widgets/section_header.dart';

/// Indigo reserved for the profile AI persona card. The rest of the app
/// keeps the teal AI accent.
const Color _aiIndigo = Color(0xFF7C5CFF);

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _unhurried = true;

  static const _preferences = [
    'Window seat',
    'Slow mornings',
    'Walkable neighborhoods',
    'Vegetarian',
  ];

  static const _trips = [
    _PastTrip(
      place: 'Kyoto, Japan',
      season: "Spring '25",
      duration: '9 days',
      highlight: 'Temple mornings, vintage cafés, and river walks.',
      tags: ['Slow pace', 'Cafés'],
      icon: Icons.temple_buddhist_outlined,
      colors: [Color(0xFFE8A0BF), Color(0xFF7C5CFF)],
    ),
    _PastTrip(
      place: 'Porto, Portugal',
      season: "Autumn '24",
      duration: '5 days',
      highlight: 'Riverside walks, tiled streets, and long lunches.',
      tags: ['Walkable', 'Food'],
      icon: Icons.water_outlined,
      colors: [Color(0xFFE8A87C), Color(0xFF0D9488)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 128),
        children: [
          const _ProfileHeader(),
          const SizedBox(height: 28),
          const SectionHeader(title: 'Travel preferences'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final preference in _preferences)
                _PreferenceChip(label: preference),
            ],
          ),
          const SizedBox(height: 24),
          _PersonaCard(
            unhurried: _unhurried,
            onChanged: (value) => setState(() => _unhurried = value),
          ),
          const SizedBox(height: 28),
          const SectionHeader(title: 'Past trips'),
          const SizedBox(height: 12),
          for (final trip in _trips) ...[
            _PastTripCard(trip: trip),
            const SizedBox(height: 12),
          ],
          const SizedBox(height: 16),
          const SectionHeader(title: 'Settings'),
          const SizedBox(height: 12),
          const _Surface(
            child: Column(
              children: [
                _SettingsRow(
                  icon: Icons.notifications_outlined,
                  label: 'Notifications',
                ),
                Divider(height: 1, indent: 52),
                _SettingsRow(icon: Icons.group_outlined, label: 'Travelers'),
                Divider(height: 1, indent: 52),
                _SettingsRow(
                  icon: Icons.payments_outlined,
                  label: 'Currency',
                  value: 'USD',
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const _Surface(
            child: _SettingsRow(
              icon: Icons.logout,
              label: 'Sign out',
              isDestructive: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: AppShadows.soft,
          ),
          child: const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/maya_chen.jpg'),
          ),
        ),
        const SizedBox(height: 14),
        Text('Maya Chen', style: text.headlineMedium),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 16,
              color: AppColors.textSecondary,
            ),
            const SizedBox(width: 4),
            Text(
              'Lisbon, Portugal 🇵🇹',
              style: text.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
        const SizedBox(height: 18),
        const _Surface(
          child: Row(
            children: [
              Expanded(child: _Stat(value: '8', label: 'Trips')),
              _StatDivider(),
              Expanded(child: _Stat(value: '14', label: 'Cities')),
              _StatDivider(),
              Expanded(child: _Stat(value: '2023', label: 'Since')),
            ],
          ),
        ),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        children: [
          Text(value, style: text.titleMedium),
          const SizedBox(height: 2),
          Text(
            label,
            style: text.labelSmall?.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 28, color: AppColors.hairline);
  }
}

class _PreferenceChip extends StatelessWidget {
  const _PreferenceChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.card,
        borderRadius: BorderRadius.circular(AppRadii.pill),
        border: Border.all(
          color: isDark ? AppColors.hairlineDark : AppColors.inputBorder,
        ),
        boxShadow: AppShadows.soft,
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

class _PersonaCard extends StatelessWidget {
  const _PersonaCard({required this.unhurried, required this.onChanged});

  final bool unhurried;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return _Surface(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Thoughtful Explorer', style: text.titleMedium),
          const SizedBox(height: 6),
          Text(
            'Paces trips around cafés, scenic walks, and architecture rather than rushing a checklist.',
            style: text.bodyMedium?.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
            decoration: BoxDecoration(
              color: _aiIndigo.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _aiIndigo.withValues(alpha: 0.28)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: _aiIndigo,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TRIPMIND AI',
                            style: text.labelSmall?.copyWith(color: _aiIndigo),
                          ),
                          Text(
                            'Suggest unhurried trips',
                            style: text.bodyMedium?.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: unhurried,
                      onChanged: onChanged,
                      activeThumbColor: Colors.white,
                      activeTrackColor: _aiIndigo,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse,
                      size: 14,
                      color: unhurried ? _aiIndigo : AppColors.textMetadata,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        unhurried
                            ? '45-minute pacing buffer between stops.'
                            : 'Pacing buffer is off.',
                        style: text.bodySmall?.copyWith(
                          color: unhurried
                              ? AppColors.textSecondary
                              : AppColors.textMetadata,
                        ),
                      ),
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

class _PastTripCard extends StatelessWidget {
  const _PastTripCard({required this.trip});

  final _PastTrip trip;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return _Surface(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: LinearGradient(
                    colors: trip.colors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(trip.icon, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trip.place, style: text.titleMedium),
                    const SizedBox(height: 2),
                    Text(
                      '${trip.season} · ${trip.duration}',
                      style: text.bodySmall,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textMetadata),
            ],
          ),
          const SizedBox(height: 12),
          Text(trip.highlight, style: text.bodyMedium),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final tag in trip.tags)
                PillBadge(
                  label: tag,
                  backgroundColor: AppColors.canvasLight,
                  foregroundColor: AppColors.textSecondary,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PastTrip {
  const _PastTrip({
    required this.place,
    required this.season,
    required this.duration,
    required this.highlight,
    required this.tags,
    required this.icon,
    required this.colors,
  });

  final String place;
  final String season;
  final String duration;
  final String highlight;
  final List<String> tags;
  final IconData icon;
  final List<Color> colors;
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({
    required this.icon,
    required this.label,
    this.value,
    this.isDestructive = false,
  });

  final IconData icon;
  final String label;
  final String? value;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? AppColors.danger : AppColors.textPrimary;
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: isDestructive ? AppColors.danger : AppColors.textSecondary, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: color),
              ),
            ),
            if (value != null)
              Text(
                value!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              )
            else if (!isDestructive)
              const Icon(Icons.chevron_right, color: AppColors.textMetadata),
          ],
        ),
      ),
    );
  }
}

class _Surface extends StatelessWidget {
  const _Surface({required this.child, this.padding = EdgeInsets.zero});

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.card,
        borderRadius: BorderRadius.circular(AppRadii.card),
        border: Border.all(
          color: isDark ? AppColors.hairlineDark : AppColors.hairline,
        ),
        boxShadow: AppShadows.soft,
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
