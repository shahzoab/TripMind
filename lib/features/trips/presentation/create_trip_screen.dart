import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/design/design_tokens.dart';
import '../../../core/widgets/app_divider.dart';
import '../domain/create_trip_form_state.dart';
import '../domain/trip_enums.dart';
import 'trip_providers.dart';

class CreateTripScreen extends ConsumerStatefulWidget {
  const CreateTripScreen({super.key});

  @override
  ConsumerState<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends ConsumerState<CreateTripScreen> {
  late final TextEditingController _destination;

  @override
  void initState() {
    super.initState();
    _destination = TextEditingController(
      text: ref.read(createTripFormProvider).destination,
    );
  }

  @override
  void dispose() {
    _destination.dispose();
    super.dispose();
  }

  Future<void> _pickDates() async {
    final now = DateTime.now();
    final form = ref.read(createTripFormProvider);
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: now.add(const Duration(days: 365)),
      initialDateRange: form.startDate != null && form.endDate != null
          ? DateTimeRange(start: form.startDate!, end: form.endDate!)
          : null,
    );
    if (picked == null) return;
    ref.read(createTripFormProvider.notifier).setDates(picked.start, picked.end);
  }

  void _generate() {
    final form = ref.read(createTripFormProvider);
    if (!form.canGenerate) return;
    context.push(AppRouter.generating);
  }

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    final form = ref.watch(createTripFormProvider);
    final fraction = form.completedSteps / 3;

    return Scaffold(
      backgroundColor: palette.surface,
      appBar: AppBar(
        backgroundColor: palette.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new, color: palette.onSurface),
        ),
        title: Text(
          'Ai Assistant Chat',
          style: DesignType.titleCard.copyWith(color: palette.onSurface),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          DesignSpacing.marginMobile,
          DesignSpacing.spaceXs,
          DesignSpacing.marginMobile,
          DesignSpacing.spaceXl,
        ),
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignSpacing.spaceSm,
                  vertical: DesignSpacing.spaceXs,
                ),
                decoration: BoxDecoration(
                  color: DesignColors.primaryFixed,
                  borderRadius: BorderRadius.circular(DesignRadius.full),
                ),
                child: Text(
                  'AI ASSISTANT V2.4',
                  style: DesignType.labelMeta.copyWith(
                    color: DesignColors.onPrimaryFixed,
                  ),
                ),
              ),
              const SizedBox(width: DesignSpacing.spaceXs),
              Container(
                width: DesignSpacing.spaceSm,
                height: DesignSpacing.spaceSm,
                decoration: const BoxDecoration(
                  color: DesignColors.tertiaryContainer,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: DesignSpacing.spaceXs),
          Text(
            'Plan a New Trip',
            style: DesignType.headlineMd.copyWith(color: palette.onSurface),
          ),
          const SizedBox(height: DesignSpacing.spaceXs),
          Text(
            "Tell tripMind what you love, we'll build your dream itinerary.",
            style: DesignType.bodyMd.copyWith(color: palette.onSurfaceVariant),
          ),
          const SizedBox(height: DesignSpacing.spaceLg),
          DecoratedBox(
            decoration: BoxDecoration(
              color: palette.containerLow,
              borderRadius: BorderRadius.circular(DesignRadius.xl),
              boxShadow: DesignElevation.tier1,
            ),
            child: Padding(
              padding: const EdgeInsets.all(DesignSpacing.spaceMd),
              child: Column(
                children: [
                  Row(
                    children: [
                      _StepMark(
                        number: '1',
                        label: 'Destination & Dates',
                        active: form.destination.trim().isNotEmpty,
                      ),
                      const Spacer(),
                      _StepMark(
                        number: '2',
                        label: 'Style',
                        active: form.travelStyle != null,
                      ),
                      const Spacer(),
                      _StepMark(
                        number: '3',
                        label: 'Pace',
                        active: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: DesignSpacing.spaceSm),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(DesignRadius.full),
                    child: SizedBox(
                      height: DesignSpacing.spaceXs + DesignMetrics.underline,
                      child: LinearProgressIndicator(
                        value: fraction,
                        backgroundColor: DesignColors.surfaceContainerHighest,
                        color: DesignColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: DesignSpacing.spaceLg),
          _FieldLabel(icon: Icons.pin_drop_outlined, label: 'Where are you heading?'),
          const SizedBox(height: DesignSpacing.spaceXs),
          DecoratedBox(
            decoration: BoxDecoration(
              color: palette.lowest,
              borderRadius: BorderRadius.circular(DesignRadius.xl),
              boxShadow: DesignElevation.tier1,
            ),
            child: SizedBox(
              height: DesignMetrics.inputHeight,
              child: Row(
                children: [
                  const SizedBox(width: DesignSpacing.spaceMd),
                  Icon(Icons.search, color: palette.outline),
                  const SizedBox(width: DesignSpacing.spaceSm),
                  Expanded(
                    child: TextField(
                      controller: _destination,
                      style: DesignType.bodyMd.copyWith(color: palette.onSurface),
                      decoration: InputDecoration(
                        hintText: 'Search city, region or country...',
                        hintStyle: DesignType.bodyMd.copyWith(color: palette.outline),
                        border: InputBorder.none,
                        isCollapsed: true,
                      ),
                      onChanged: (value) {
                        ref.read(createTripFormProvider.notifier).setDestination(value);
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _destination.clear();
                      ref.read(createTripFormProvider.notifier).setDestination('');
                    },
                    icon: Icon(Icons.close, color: palette.outline),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: DesignSpacing.spaceXs),
          SizedBox(
            height: DesignMetrics.touchTarget,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: destinationSuggestions.length,
              separatorBuilder: (_, _) => const SizedBox(width: DesignSpacing.spaceXs),
              itemBuilder: (context, index) {
                final suggestion = destinationSuggestions[index];
                final selected = form.destination == suggestion.label;
                return Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: selected
                          ? DesignColors.primaryFixed
                          : palette.containerLow,
                      foregroundColor: selected
                          ? DesignColors.onPrimaryFixed
                          : palette.onSurfaceVariant,
                      padding: const EdgeInsets.symmetric(
                        horizontal: DesignSpacing.gutterSm,
                        vertical: DesignSpacing.spaceXs,
                      ),
                      shape: const StadiumBorder(),
                      minimumSize: const Size(0, DesignMetrics.touchTarget),
                    ),
                    onPressed: () {
                      _destination.text = suggestion.label;
                      ref
                          .read(createTripFormProvider.notifier)
                          .setDestination(suggestion.label);
                    },
                    child: Text(suggestion.label, style: DesignType.labelMeta),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: DesignSpacing.spaceLg),
          _FieldLabel(icon: Icons.calendar_month_outlined, label: 'Travel Window'),
          const SizedBox(height: DesignSpacing.spaceXs),
          Material(
            color: palette.lowest,
            borderRadius: BorderRadius.circular(DesignRadius.xl),
            child: InkWell(
              borderRadius: BorderRadius.circular(DesignRadius.xl),
              onTap: _pickDates,
              child: Padding(
                padding: const EdgeInsets.all(DesignSpacing.spaceMd),
                child: Row(
                  children: [
                    Container(
                      width: DesignMetrics.touchTarget,
                      height: DesignMetrics.touchTarget,
                      decoration: BoxDecoration(
                        color: DesignColors.primaryFixed,
                        borderRadius: BorderRadius.circular(DesignRadius.xl),
                      ),
                      child: const Icon(
                        Icons.date_range,
                        color: DesignColors.primary,
                      ),
                    ),
                    const SizedBox(width: DesignSpacing.spaceMd),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _dateLabel(form),
                            style: DesignType.titleCard.copyWith(
                              color: palette.onSurface,
                            ),
                          ),
                          Text(
                            _dateDetail(form),
                            style: DesignType.labelMeta.copyWith(
                              color: palette.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: palette.outline),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: DesignSpacing.spaceLg),
          _FieldLabel(icon: Icons.interests_outlined, label: 'Vibe & Travel Style'),
          const SizedBox(height: DesignSpacing.spaceXs),
          DecoratedBox(
            decoration: BoxDecoration(
              color: palette.lowest,
              borderRadius: BorderRadius.circular(DesignRadius.xl),
            ),
            child: Column(
              children: [
                for (var index = 0; index < TripStyle.values.length; index++) ...[
                  if (index > 0) const AppDivider(),
                  _StyleRow(
                    style: TripStyle.values[index],
                    selected: form.travelStyle == TripStyle.values[index],
                    onTap: () {
                      ref
                          .read(createTripFormProvider.notifier)
                          .setTravelStyle(TripStyle.values[index]);
                    },
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: DesignSpacing.spaceLg),
          DecoratedBox(
            decoration: BoxDecoration(
              color: palette.lowest,
              borderRadius: BorderRadius.circular(DesignRadius.xl),
              boxShadow: DesignElevation.tier1,
            ),
            child: Padding(
              padding: const EdgeInsets.all(DesignSpacing.spaceMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const _FieldLabel(
                        icon: Icons.payments_outlined,
                        label: 'Budget Tier',
                      ),
                      const Spacer(),
                      Text(
                        form.budgetTier.title,
                        style: DesignType.labelPill.copyWith(
                          color: DesignColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: DesignSpacing.spaceXs),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: palette.containerLow,
                      borderRadius: BorderRadius.circular(DesignRadius.xl),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(DesignSpacing.spaceXs),
                      child: Row(
                        children: [
                          for (final tier in BudgetTier.values)
                            Expanded(
                              child: _BudgetSegment(
                                label: tier.symbol,
                                selected: form.budgetTier == tier,
                                onTap: () {
                                  ref
                                      .read(createTripFormProvider.notifier)
                                      .setBudgetTier(tier);
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: DesignSpacing.spaceMd),
                  Row(
                    children: [
                      const _FieldLabel(
                        icon: Icons.speed,
                        label: 'Daily Pace',
                      ),
                      const Spacer(),
                      Text(
                        form.dailyPace.detail,
                        style: DesignType.labelPill.copyWith(
                          color: DesignColors.secondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: DesignSpacing.spaceSm),
                  Row(
                    children: [
                      for (final pace in DailyPace.values)
                        Expanded(
                          child: _PaceTarget(
                            label: pace.title,
                            selected: form.dailyPace == pace,
                            onTap: () {
                              ref
                                  .read(createTripFormProvider.notifier)
                                  .setDailyPace(pace);
                            },
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: DesignSpacing.spaceLg),
          DecoratedBox(
            decoration: BoxDecoration(
              color: DesignColors.primaryFixed.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(DesignRadius.xl),
            ),
            child: Padding(
              padding: const EdgeInsets.all(DesignSpacing.spaceSm),
              child: Row(
                children: [
                  Container(
                    width: DesignMetrics.node,
                    height: DesignMetrics.node,
                    decoration: const BoxDecoration(
                      color: DesignColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.auto_awesome,
                      color: DesignColors.onPrimary,
                    ),
                  ),
                  const SizedBox(width: DesignSpacing.spaceSm),
                  Expanded(
                    child: Text(
                      'AI will optimize routes to minimize transit time and crowds.',
                      style: DesignType.labelMeta.copyWith(
                        color: DesignColors.onPrimaryFixed,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: DesignSpacing.spaceLg),
          Opacity(
            opacity: form.canGenerate ? 1 : 0.45,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: DesignColors.ai,
                borderRadius: BorderRadius.circular(DesignRadius.xl),
                boxShadow: DesignElevation.tier2,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(DesignRadius.xl),
                  onTap: form.canGenerate ? _generate : null,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: DesignMetrics.touchTarget,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: DesignSpacing.spaceMd,
                        horizontal: DesignSpacing.spaceLg,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.auto_awesome, color: DesignColors.onPrimary),
                          const SizedBox(width: DesignSpacing.spaceSm),
                          Text(
                            'Generate Itinerary with AI',
                            style: DesignType.titleCard.copyWith(
                              color: DesignColors.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
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

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: DesignColors.primary, size: DesignType.headlineSm.fontSize),
        const SizedBox(width: DesignSpacing.spaceXs),
        Text(label, style: DesignType.labelPill.copyWith(color: palette.onSurface)),
      ],
    );
  }
}

class _StepMark extends StatelessWidget {
  const _StepMark({
    required this.number,
    required this.label,
    required this.active,
  });

  final String number;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    final color = active ? DesignColors.primary : palette.onSurfaceVariant;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: DesignSpacing.spaceMd,
          height: DesignSpacing.spaceMd,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? DesignColors.primary : palette.containerHigh,
            shape: BoxShape.circle,
          ),
          child: Text(
            number,
            style: DesignType.labelMeta.copyWith(
              color: active ? DesignColors.onPrimary : palette.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(width: DesignSpacing.spaceXs),
        Text(label, style: DesignType.labelMeta.copyWith(color: color)),
      ],
    );
  }
}

class _StyleRow extends StatelessWidget {
  const _StyleRow({
    required this.style,
    required this.selected,
    required this.onTap,
  });

  final TripStyle style;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    return InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: DesignMetrics.touchTarget),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignSpacing.spaceMd,
            vertical: DesignSpacing.gutterSm,
          ),
          child: Row(
            children: [
              Container(
                width: DesignMetrics.radio,
                height: DesignMetrics.radio,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? DesignColors.primary : Colors.transparent,
                  border: Border.all(
                    color: selected ? DesignColors.primary : palette.outline,
                  ),
                ),
                child: selected
                    ? const Icon(
                        Icons.check,
                        size: DesignSpacing.gutterSm,
                        color: DesignColors.onPrimary,
                      )
                    : null,
              ),
              const SizedBox(width: DesignSpacing.spaceSm),
              Expanded(
                child: Text(
                  style.title,
                  style: DesignType.bodyMd.copyWith(color: palette.onSurface),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BudgetSegment extends StatelessWidget {
  const _BudgetSegment({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    return Material(
      color: selected ? DesignColors.primary : Colors.transparent,
      borderRadius: BorderRadius.circular(DesignRadius.lg),
      child: InkWell(
        borderRadius: BorderRadius.circular(DesignRadius.lg),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: DesignSpacing.spaceSm),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: DesignType.labelPill.copyWith(
              color: selected ? DesignColors.onPrimary : palette.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}

class _PaceTarget extends StatelessWidget {
  const _PaceTarget({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DesignSpacing.spaceXs),
        child: Column(
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: DesignType.labelMeta.copyWith(
                color: selected ? DesignColors.primary : palette.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: DesignSpacing.spaceXs),
            Container(
              height: DesignMetrics.underline,
              color: selected ? DesignColors.primary : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}

const _months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

String _dateLabel(CreateTripFormState form) {
  final start = form.startDate;
  final end = form.endDate;
  if (start == null || end == null) return 'Select dates';
  return '${_format(start)} – ${_format(end)}';
}

String _dateDetail(CreateTripFormState form) {
  final start = form.startDate;
  final end = form.endDate;
  if (start == null || end == null) return 'Destination and dates are required';
  final days = end.difference(start).inDays + 1;
  return '$days days';
}

String _format(DateTime date) {
  return '${_months[date.month - 1]} ${date.day}, ${date.year}';
}
