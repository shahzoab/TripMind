import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/widgets/ai_banner.dart';
import '../../core/widgets/pill_badge.dart';
import '../home/home_shell.dart';
import 'itinerary_day_screen.dart';

class TripOverviewScreen extends StatefulWidget {
  const TripOverviewScreen({super.key});

  @override
  State<TripOverviewScreen> createState() => _TripOverviewScreenState();
}

class _TripOverviewScreenState extends State<TripOverviewScreen> {
  int _selectedDay = 2;

  static const _dayDates = [
    'Apr 12',
    'Apr 13',
    'Apr 14',
    'Apr 15',
    'Apr 16',
    'Apr 17',
    'Apr 18',
    'Apr 19',
  ];

  void _goBack() {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
      return;
    }
    ShellTabs.index.value = 0;
  }

  void _openDayPlan() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ItineraryDayScreen(day: _selectedDay)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _goBack,
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('tripMind'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.ios_share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.primary,
              child: Text(
                'S',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 128),
        children: [
          const _HeroCard(),
          const SizedBox(height: 16),
          AiBanner(
            label: 'tripMind copilot',
            trailing: Text(
              'Proactive Sync',
              style: text.labelSmall?.copyWith(color: AppColors.primary),
            ),
            message:
                'Optimal sakura bloom projected for Ueno Park on Day 3. '
                'Quiet mornings staged in Shibuya, with one flexible afternoon '
                'reserved for spring rain.',
            footer: const _CopilotFooter(),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(
                child: _StatBox(
                  label: 'Duration',
                  value: '8 days',
                  icon: Icons.calendar_today_outlined,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _StatBox(
                  label: 'Scheduled',
                  value: '14 stops',
                  icon: Icons.confirmation_number_outlined,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _StatBox(
                  label: 'Est. Budget',
                  value: '\$2,480',
                  icon: Icons.account_balance_wallet_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Text('Itinerary Schedule', style: text.titleMedium),
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {},
                icon: const Icon(Icons.calendar_month_outlined, size: 16),
                label: const Text('View calendar'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 68,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _dayDates.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final day = index + 1;
                return _DayPill(
                  day: day,
                  date: _dayDates[index],
                  selected: day == _selectedDay,
                  onTap: () => setState(() => _selectedDay = day),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          const _NextUpCard(),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(52),
              ),
              onPressed: _openDayPlan,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Open day plan'),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, size: 18),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.settings_outlined, size: 16),
              label: const Text('Edit trip settings & preferences'),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.card,
        borderRadius: BorderRadius.circular(AppRadii.card),
        border: Border.all(
          color: isDark ? AppColors.hairlineDark : AppColors.hairline,
        ),
        boxShadow: AppShadows.soft,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 196,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/tokyo_spring_hero.jpg',
                  fit: BoxFit.cover,
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Color(0x73000000)],
                      stops: [0.55, 1],
                    ),
                  ),
                ),
                const Positioned(
                  top: 12,
                  left: 12,
                  child: _FrostedLabel(
                    icon: Icons.schedule,
                    label: 'T-minus 18 days',
                  ),
                ),
                const Positioned(
                  top: 12,
                  right: 12,
                  child: PillBadge(
                    label: 'Confirmed',
                    icon: Icons.check_circle,
                    backgroundColor: AppColors.success,
                    foregroundColor: Colors.white,
                  ),
                ),
                const Positioned(
                  left: 12,
                  bottom: 12,
                  child: _FrostedLabel(
                    icon: Icons.location_on_outlined,
                    label: 'Tokyo, Japan',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tokyo in Spring', style: text.headlineMedium),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 12,
                        runSpacing: 4,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 16,
                                color: AppColors.textSecondary,
                              ),
                              const SizedBox(width: 6),
                              Text('12–20 Apr 2026', style: text.bodySmall),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.people_outline,
                                size: 16,
                                color: AppColors.textSecondary,
                              ),
                              const SizedBox(width: 6),
                              Text('4 Travelers', style: text.bodySmall),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const _AvatarStack(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FrostedLabel extends StatelessWidget {
  const _FrostedLabel({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          color: const Color(0xFF1C1C1E).withValues(alpha: 0.6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 14, color: Colors.white),
              const SizedBox(width: 4),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarStack extends StatelessWidget {
  const _AvatarStack();

  static const _people = [
    ('MK', Color(0xFF7C5CFF), Colors.white),
    ('AL', AppColors.primary, Colors.white),
    ('+1', Color(0xFFE5E5EA), AppColors.ink),
  ];

  @override
  Widget build(BuildContext context) {
    const radius = 16.0;
    const overlap = 18.0;
    final width = radius * 2 + overlap * (_people.length - 1);
    return SizedBox(
      width: width,
      height: radius * 2,
      child: Stack(
        children: [
          for (var i = 0; i < _people.length; i++)
            Positioned(
              left: i * overlap,
              child: CircleAvatar(
                radius: radius,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: radius - 1.5,
                  backgroundColor: _people[i].$2,
                  child: Text(
                    _people[i].$1,
                    style: TextStyle(
                      color: _people[i].$3,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _CopilotFooter extends StatelessWidget {
  const _CopilotFooter();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Row(
      children: [
        const Icon(
          Icons.verified_outlined,
          size: 14,
          color: AppColors.success,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            'Live Weather & Transit verified',
            style: text.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            visualDensity: VisualDensity.compact,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text('View 2 Insights'),
        ),
      ],
    );
  }
}

class _StatBox extends StatelessWidget {
  const _StatBox({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 10, 14),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.card,
        borderRadius: BorderRadius.circular(AppRadii.card),
        border: Border.all(
          color: isDark ? AppColors.hairlineDark : AppColors.hairline,
        ),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: text.labelSmall?.copyWith(color: AppColors.textSecondary),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(icon, size: 16, color: AppColors.textSecondary),
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: text.titleMedium),
        ],
      ),
    );
  }
}

class _DayPill extends StatelessWidget {
  const _DayPill({
    required this.day,
    required this.date,
    required this.selected,
    required this.onTap,
  });

  final int day;
  final String date;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final foreground = selected ? Colors.white : AppColors.textPrimary;
    final dateColor = selected ? Colors.white.withValues(alpha: 0.85) : AppColors.textSecondary;
    return Material(
      color: selected
          ? AppColors.primary
          : (isDark ? AppColors.cardDark : AppColors.card),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          constraints: const BoxConstraints(minWidth: 76),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selected
                  ? AppColors.primary
                  : (isDark ? AppColors.hairlineDark : AppColors.hairline),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Day $day',
                style: text.labelMedium?.copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(date, style: text.bodySmall?.copyWith(color: dateColor)),
            ],
          ),
        ),
      ),
    );
  }
}

class _NextUpCard extends StatelessWidget {
  const _NextUpCard();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.card,
        borderRadius: BorderRadius.circular(AppRadii.card),
        border: Border.all(
          color: isDark ? AppColors.hairlineDark : AppColors.hairline,
        ),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'NEXT UP TODAY',
                    style: text.labelSmall?.copyWith(
                      letterSpacing: 0.5,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const PillBadge(
                label: 'Ticket ready',
                icon: Icons.confirmation_number_outlined,
                backgroundColor: Color(0xFFE8F8EC),
                foregroundColor: AppColors.success,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/teamlab_thumb.jpg',
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '09:30 AM · Toyosu, Tokyo',
                      style: text.bodySmall,
                    ),
                    const SizedBox(height: 2),
                    Text('teamLab Planets', style: text.titleMedium),
                    Text(
                      'Immersive Digital Body Art &...',
                      style: text.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text('2.5h', style: text.bodySmall),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.near_me_outlined, size: 16),
                  label: const Text('Get directions'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.qr_code_2_outlined, size: 16),
                  label: const Text('Pass'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
