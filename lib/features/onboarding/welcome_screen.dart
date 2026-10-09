import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/auth_session.dart';
import '../../app/router.dart';
import '../../core/colors.dart';
import '../../core/widgets/ai_gradient_button.dart';
import '../../core/widgets/photo_placeholder.dart';
import '../../core/widgets/pill_badge.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pages = PageController();
  int _page = 0;

  static const int _pageCount = 3;

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  void _openHome() {
    ProviderScope.containerOf(context).read(authSessionProvider.notifier).enter();
    context.go(AppRouter.home);
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _TopBar(onSkip: _openHome),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _HeroCard(),
                      const SizedBox(height: 24),
                      const _Headline(),
                      const SizedBox(height: 8),
                      Text(
                        'Intelligent syncing, real-time recalculations, and serene itineraries designed around how you uniquely wander.',
                        style: text.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 214,
                        child: PageView.builder(
                          controller: _pages,
                          itemCount: _pageCount,
                          onPageChanged: (index) =>
                              setState(() => _page = index),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: _ValueCard(index: index),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              _PageDots(count: _pageCount, index: _page),
              const SizedBox(height: 16),
              AiGradientButton(label: 'Get Started', onPressed: _openHome),
              TextButton(
                onPressed: _openHome,
                child: const Text('I already have an account • Log in'),
              ),
              Text(
                'No credit card required • Private cloud vault',
                textAlign: TextAlign.center,
                style: text.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onSkip});

  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _Wordmark(),
        const Spacer(),
        TextButton(onPressed: onSkip, child: const Text('Skip')),
      ],
    );
  }
}

class _Wordmark extends StatelessWidget {
  const _Wordmark();

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

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadii.card),
        boxShadow: AppShadows.soft,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadii.card),
        child: Stack(
          children: [
            const PhotoPlaceholder(
              icon: Icons.landscape_outlined,
              height: 248,
              borderRadius: 0,
              darkOverlay: true,
              colors: [Color(0xFF7BA3C9), Color(0xFFD7E3EA), Color(0xFF1F3A4D)],
            ),
            Positioned(
              top: 12,
              left: 12,
              right: 12,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: const [
                  PillBadge(
                    label: 'Tokyo • Kyoto • Fuji ready',
                    icon: Icons.place_outlined,
                    backgroundColor: Color(0xEBFFFFFF),
                    foregroundColor: AppColors.textPrimary,
                  ),
                  PillBadge(
                    label: '18°C • Clear',
                    icon: Icons.wb_sunny_outlined,
                    backgroundColor: Color(0xEBFFFFFF),
                    foregroundColor: AppColors.textPrimary,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EXPLORE WITHOUT FRICTION',
                    style: text.labelSmall?.copyWith(
                      color: Colors.white,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Honshu Golden Route',
                    style: text.headlineSmall?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      _AvatarCluster(
                        colors: [
                          Color(0xFF007AFF),
                          Color(0xFF0D9488),
                          Color(0xFFFF9500),
                        ],
                      ),
                      SizedBox(width: 8),
                      Text(
                        '+3.4k planned',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Headline extends StatelessWidget {
  const _Headline();

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.headlineLarge;
    return Text.rich(
      TextSpan(
        style: headline,
        children: [
          const TextSpan(text: 'Effortless travel, powered by your '),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) {
                return AppGradients.aiText.createShader(bounds);
              },
              child: Text('AI copilot.', style: headline),
            ),
          ),
        ],
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  const _ValueCard({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final data = _cards[index];
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadii.card),
        boxShadow: AppShadows.soft,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PillBadge(
              label: data.tag,
              backgroundColor: AppColors.primary.withValues(alpha: 0.1),
              foregroundColor: AppColors.primary,
            ),
            const SizedBox(height: 10),
            Text(data.title, style: text.titleMedium),
            const Spacer(),
            data.visual,
          ],
        ),
      ),
    );
  }
}

class _ValueCardData {
  const _ValueCardData({
    required this.title,
    required this.tag,
    required this.visual,
  });

  final String title;
  final String tag;
  final Widget visual;
}

final List<_ValueCardData> _cards = [
  _ValueCardData(
    title: 'AI Itineraries in Seconds',
    tag: 'Instant',
    visual: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.canvasLight,
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: const Text(
        'Add a slow morning cafe walk in Gion...',
        style: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ),
  const _ValueCardData(
    title: 'Smart Interactive Map',
    tag: 'Live Sync',
    visual: _MapPreview(),
  ),
  const _ValueCardData(
    title: 'Live Flight & Delay Radar',
    tag: 'Automated',
    visual: _FlightPreview(),
  ),
];

class _MapPreview extends StatelessWidget {
  const _MapPreview();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _SpotDot(color: AppColors.primary),
        const _WalkLine(),
        const _SpotDot(color: AppColors.aiCyan),
        const _WalkLine(),
        const _SpotDot(color: AppColors.success),
        const SizedBox(width: 10),
        Text('1.2 km • 14 min', style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}

class _SpotDot extends StatelessWidget {
  const _SpotDot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 4)],
      ),
    );
  }
}

class _WalkLine extends StatelessWidget {
  const _WalkLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 2,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      color: AppColors.textMetadata.withValues(alpha: 0.7),
    );
  }
}

class _FlightPreview extends StatelessWidget {
  const _FlightPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.canvasLight,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.flight_takeoff, size: 18, color: AppColors.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'NH 007 • Gate 42A On Schedule',
              style: Theme.of(context).textTheme.labelMedium
                  ?.copyWith(color: AppColors.textPrimary),
            ),
          ),
        ],
      ),
    );
  }
}

class _PageDots extends StatelessWidget {
  const _PageDots({required this.count, required this.index});

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: i == index ? 16 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: i == index
                  ? AppColors.primary
                  : AppColors.textMetadata.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(99),
            ),
          ),
      ],
    );
  }
}

class _AvatarCluster extends StatelessWidget {
  const _AvatarCluster({required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    const diameter = 22.0;
    final step = diameter * 0.62;
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
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
