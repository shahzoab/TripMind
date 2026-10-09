import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/widgets/ai_banner.dart';
import '../../core/widgets/app_bottom_nav.dart';
import '../../core/widgets/photo_placeholder.dart';
import '../../core/widgets/pill_badge.dart';
import '../home/home_shell.dart';

/// Tokyo day timeline. Day 2 is the Asakusa → Akihabara plan; other days
/// swap the header and stops so the day selector stays interactive.
class ItineraryDayScreen extends StatefulWidget {
  const ItineraryDayScreen({super.key, required this.day});

  final int day;

  @override
  State<ItineraryDayScreen> createState() => _ItineraryDayScreenState();
}

class _ItineraryDayScreenState extends State<ItineraryDayScreen> {
  late int _day;
  bool _showMap = false;
  bool _reorder = false;
  StopKind? _filter;
  final Set<String> _collapsed = {};
  final Set<String> _saved = {};
  late List<ItineraryStop> _stops;
  int _added = 0;

  static const List<AppBottomNavDestination> _tabs = [
    AppBottomNavDestination(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      label: 'Home',
    ),
    AppBottomNavDestination(
      icon: Icons.map_outlined,
      selectedIcon: Icons.map,
      label: 'Itinerary',
    ),
    AppBottomNavDestination(
      icon: Icons.flight_outlined,
      selectedIcon: Icons.flight,
      label: 'Flights',
    ),
    AppBottomNavDestination(
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
      label: 'Profile',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _day = widget.day.clamp(1, _plans.length);
    _stops = List<ItineraryStop>.of(_plans[_day - 1].stops);
  }

  DayPlan get _plan => _plans[_day - 1];

  List<ItineraryStop> get _visible {
    final kind = _filter;
    if (kind == null) return _stops;
    return [
      for (final stop in _stops)
        if (stop.kind == kind) stop,
    ];
  }

  void _selectDay(int day) {
    setState(() {
      _day = day;
      _stops = List<ItineraryStop>.of(_plans[day - 1].stops);
      _collapsed.clear();
      _filter = null;
      _reorder = false;
    });
  }

  void _onTab(int index) {
    if (index == 1) return;
    ShellTabs.index.value = index;
    final navigator = Navigator.of(context);
    if (navigator.canPop()) navigator.pop();
  }

  Future<void> _openTools() async {
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filter stops',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    FilterChip(
                      label: const Text('All'),
                      selected: _filter == null,
                      onSelected: (_) {
                        _applyFilter(null);
                        Navigator.pop(context);
                      },
                    ),
                    for (final kind in StopKind.values)
                      FilterChip(
                        label: Text(kind.label),
                        selected: _filter == kind,
                        onSelected: (_) {
                          _applyFilter(kind);
                          Navigator.pop(context);
                        },
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Reorder stops'),
                  value: _reorder,
                  onChanged: (value) {
                    Navigator.pop(context);
                    setState(() => _reorder = value);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _applyFilter(StopKind? kind) {
    setState(() => _filter = kind);
  }

  Future<void> _openAddSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.add_location_alt_outlined),
                title: const Text('Add a place'),
                subtitle: const Text('Drop an open block onto this day'),
                onTap: () {
                  Navigator.pop(context);
                  _addStop(_blankStop());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.auto_awesome,
                  color: AppColors.aiAccent,
                ),
                title: const Text('AI idea'),
                subtitle: const Text('Kappabashi Kitchen Street · 25 min walk'),
                onTap: () {
                  Navigator.pop(context);
                  _addStop(_aiStop());
                  _toast('Added an AI idea to Day $_day');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _addStop(ItineraryStop stop) {
    setState(() => _stops = [..._stops, stop]);
  }

  ItineraryStop _blankStop() {
    _added += 1;
    return ItineraryStop(
      id: 'custom-$_added',
      time: '08:00 PM',
      duration: '1 hr',
      title: 'New place $_added',
      summary: 'Open block. Tap to expand, then save it for later.',
      kind: StopKind.temple,
      status: 'Draft',
      tone: StatusTone.neutral,
    );
  }

  ItineraryStop _aiStop() {
    _added += 1;
    return ItineraryStop(
      id: 'ai-$_added',
      time: '04:15 PM',
      duration: '40 min',
      title: 'Kappabashi Kitchen Street',
      summary:
          'Knife shops and sample-food windows between lunch and Akihabara.',
      kind: StopKind.shopping,
      status: 'AI idea',
      tone: StatusTone.info,
      walkNote: '12 min walk from Asakusa',
    );
  }

  void _toast(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  void _share(ItineraryStop stop) {
    _toast('Share link ready for ${stop.title}');
  }

  void _toggleSave(ItineraryStop stop) {
    setState(() {
      if (!_saved.add(stop.id)) _saved.remove(stop.id);
    });
    _toast(
      _saved.contains(stop.id)
          ? 'Saved ${stop.title}'
          : 'Removed ${stop.title}',
    );
  }

  Future<void> _viewSlip(ItineraryStop stop) async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Reservation slip'),
          content: Text(
            '${stop.title}\n${stop.time} · ${_plan.dateLabel}\n'
            'Ref ${stop.bookingRef}\nParty of 2 · Private cedar room',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                _NavBar(
                  mapActive: _showMap,
                  toolsActive: _filter != null || _reorder,
                  onShare: () =>
                      _toast('Trip link ready for Tokyo Autumn Discovery'),
                  onToggleMap: () => setState(() => _showMap = !_showMap),
                  onTools: _openTools,
                ),
                _DaySelector(selectedDay: _day, onSelected: _selectDay),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: _showMap
                        ? _MapCanvas(
                            key: const ValueKey('map'),
                            stops: _visible,
                            plan: _plan,
                          )
                        : _Agenda(
                            key: const ValueKey('agenda'),
                            plan: _plan,
                            stops: _visible,
                            stopCount: _stops.length,
                            reorder: _reorder,
                            collapsed: _collapsed,
                            saved: _saved,
                            onReorderItem: (oldIndex, newIndex) {
                              setState(() {
                                final next = List<ItineraryStop>.of(_visible);
                                final moved = next.removeAt(oldIndex);
                                next.insert(newIndex, moved);
                                _stops = _mergeReorder(next);
                              });
                            },
                            onToggle: (id) => setState(() {
                              if (!_collapsed.add(id)) _collapsed.remove(id);
                            }),
                            onSave: _toggleSave,
                            onShare: _share,
                            onSlip: _viewSlip,
                          ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 108,
              child: Center(child: _AddPill(onPressed: _openAddSheet)),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 0,
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: AppBottomNav(
                    currentIndex: 1,
                    onTap: _onTab,
                    destinations: _tabs,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ItineraryStop> _mergeReorder(List<ItineraryStop> visible) {
    if (_filter == null) return visible;
    final hidden = [
      for (final stop in _stops)
        if (stop.kind != _filter) stop,
    ];
    return [...visible, ...hidden];
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar({
    required this.mapActive,
    required this.toolsActive,
    required this.onShare,
    required this.onToggleMap,
    required this.onTools,
  });

  final bool mapActive;
  final bool toolsActive;
  final VoidCallback onShare;
  final VoidCallback onToggleMap;
  final VoidCallback onTools;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 4),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: AppColors.aiGradient,
            ),
            child: const Icon(
              Icons.auto_awesome,
              color: Colors.white,
              size: 16,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('tripMind', style: text.labelSmall),
                Text(
                  'Tokyo Autumn Discovery',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: text.titleMedium,
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Share',
            onPressed: onShare,
            icon: const Icon(Icons.ios_share),
          ),
          IconButton(
            tooltip: mapActive ? 'Timeline' : 'Map',
            onPressed: onToggleMap,
            icon: Icon(
              mapActive ? Icons.view_timeline_outlined : Icons.map_outlined,
              color: mapActive ? AppColors.primary : null,
            ),
          ),
          IconButton(
            tooltip: 'Reorder and filter',
            onPressed: onTools,
            icon: Icon(
              Icons.tune,
              color: toolsActive ? AppColors.primary : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _DaySelector extends StatelessWidget {
  const _DaySelector({required this.selectedDay, required this.onSelected});

  final int selectedDay;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        itemCount: _plans.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final plan = _plans[index];
          final selected = plan.day == selectedDay;
          return ChoiceChip(
            label: Text(plan.tabLabel),
            selected: selected,
            showCheckmark: false,
            onSelected: (_) => onSelected(plan.day),
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: selected
                  ? Colors.white
                  : Theme.of(context).colorScheme.onSurface,
            ),
            selectedColor: AppColors.primary,
            backgroundColor: Theme.of(context).cardTheme.color,
            side: BorderSide(
              color: selected
                  ? AppColors.primary
                  : Theme.of(context).colorScheme.outlineVariant,
            ),
            shape: const StadiumBorder(),
          );
        },
      ),
    );
  }
}

class _Agenda extends StatelessWidget {
  const _Agenda({
    super.key,
    required this.plan,
    required this.stops,
    required this.stopCount,
    required this.reorder,
    required this.collapsed,
    required this.saved,
    required this.onReorderItem,
    required this.onToggle,
    required this.onSave,
    required this.onShare,
    required this.onSlip,
  });

  final DayPlan plan;
  final List<ItineraryStop> stops;
  final int stopCount;
  final bool reorder;
  final Set<String> collapsed;
  final Set<String> saved;
  final void Function(int oldIndex, int newIndex) onReorderItem;
  final ValueChanged<String> onToggle;
  final ValueChanged<ItineraryStop> onSave;
  final ValueChanged<ItineraryStop> onShare;
  final ValueChanged<ItineraryStop> onSlip;

  @override
  Widget build(BuildContext context) {
    final header = _DaySummary(plan: plan, stopCount: stopCount);
    if (reorder) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: header,
          ),
          Expanded(
            child: ReorderableListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 180),
              itemCount: stops.length,
              onReorderItem: onReorderItem,
              itemBuilder: (context, index) {
                final stop = stops[index];
                return Padding(
                  key: ValueKey(stop.id),
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.drag_handle,
                        color: AppColors.inkTertiary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _StopCard(
                          stop: stop,
                          expanded: !collapsed.contains(stop.id),
                          saved: saved.contains(stop.id),
                          onToggle: () => onToggle(stop.id),
                          onSave: () => onSave(stop),
                          onShare: () => onShare(stop),
                          onSlip: () => onSlip(stop),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 180),
      children: [
        header,
        const SizedBox(height: 20),
        _Timeline(
          stops: stops,
          collapsed: collapsed,
          saved: saved,
          onToggle: onToggle,
          onSave: onSave,
          onShare: onShare,
          onSlip: onSlip,
        ),
      ],
    );
  }
}

class _DaySummary extends StatelessWidget {
  const _DaySummary({required this.plan, required this.stopCount});

  final DayPlan plan;
  final int stopCount;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? AppColors.hairlineDark : AppColors.hairline,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.wb_sunny_outlined,
                size: 16,
                color: AppColors.warning,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  plan.weather,
                  style: text.labelMedium?.copyWith(color: AppColors.warning),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(plan.theme, style: text.headlineSmall),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              PillBadge(
                label: '$stopCount curated stops',
                icon: Icons.place_outlined,
              ),
              PillBadge(label: plan.walking, icon: Icons.directions_walk),
              PillBadge(label: plan.pacing, icon: Icons.schedule),
            ],
          ),
        ],
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  const _Timeline({
    required this.stops,
    required this.collapsed,
    required this.saved,
    required this.onToggle,
    required this.onSave,
    required this.onShare,
    required this.onSlip,
  });

  final List<ItineraryStop> stops;
  final Set<String> collapsed;
  final Set<String> saved;
  final ValueChanged<String> onToggle;
  final ValueChanged<ItineraryStop> onSave;
  final ValueChanged<ItineraryStop> onShare;
  final ValueChanged<ItineraryStop> onSlip;

  @override
  Widget build(BuildContext context) {
    final line = Theme.of(context).colorScheme.outlineVariant;
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(painter: _SpinePainter(color: line)),
        ),
        Column(
          children: [
            for (var i = 0; i < stops.length; i++) ...[
              if (stops[i].transitBefore != null)
                _TransitRow(hop: stops[i].transitBefore!),
              _StopRow(
                stop: stops[i],
                expanded: !collapsed.contains(stops[i].id),
                saved: saved.contains(stops[i].id),
                onToggle: () => onToggle(stops[i].id),
                onSave: () => onSave(stops[i]),
                onShare: () => onShare(stops[i]),
                onSlip: () => onSlip(stops[i]),
              ),
              if (i != stops.length - 1) const SizedBox(height: 8),
            ],
          ],
        ),
      ],
    );
  }
}

class _SpinePainter extends CustomPainter {
  const _SpinePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    const x = 18.0;
    canvas.drawLine(const Offset(x, 18), Offset(x, size.height - 12), paint);
  }

  @override
  bool shouldRepaint(covariant _SpinePainter oldDelegate) =>
      oldDelegate.color != color;
}

class _StopRow extends StatelessWidget {
  const _StopRow({
    required this.stop,
    required this.expanded,
    required this.saved,
    required this.onToggle,
    required this.onSave,
    required this.onShare,
    required this.onSlip,
  });

  final ItineraryStop stop;
  final bool expanded;
  final bool saved;
  final VoidCallback onToggle;
  final VoidCallback onSave;
  final VoidCallback onShare;
  final VoidCallback onSlip;

  @override
  Widget build(BuildContext context) {
    final canvas = Theme.of(context).scaffoldBackgroundColor;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: stop.kind.color,
            shape: BoxShape.circle,
            border: Border.all(color: canvas, width: 3),
          ),
          child: Icon(stop.kind.icon, size: 16, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StopCard(
            stop: stop,
            expanded: expanded,
            saved: saved,
            onToggle: onToggle,
            onSave: onSave,
            onShare: onShare,
            onSlip: onSlip,
          ),
        ),
      ],
    );
  }
}

class _TransitRow extends StatelessWidget {
  const _TransitRow({required this.hop});

  final TransitHop hop;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: Theme.of(context).cardTheme.color,
                shape: BoxShape.circle,
                border: Border.all(color: scheme.outlineVariant),
              ),
              child: const Icon(
                Icons.subway,
                size: 12,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                '🚇 ${hop.line} • ${hop.detail} • ${hop.fare}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: scheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StopCard extends StatelessWidget {
  const _StopCard({
    required this.stop,
    required this.expanded,
    required this.saved,
    required this.onToggle,
    required this.onSave,
    required this.onShare,
    required this.onSlip,
  });

  final ItineraryStop stop;
  final bool expanded;
  final bool saved;
  final VoidCallback onToggle;
  final VoidCallback onSave;
  final VoidCallback onShare;
  final VoidCallback onSlip;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark ? AppColors.hairlineDark : AppColors.hairline,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.05),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(20),
            child: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${stop.time} • ${stop.duration}',
                                style: text.labelSmall,
                              ),
                              const SizedBox(height: 6),
                              Text(stop.title, style: text.titleMedium),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (stop.status != null)
                              PillBadge(
                                label: stop.status!,
                                backgroundColor: stop.tone.background,
                                foregroundColor: stop.tone.foreground,
                              ),
                            Icon(
                              expanded ? Icons.expand_less : Icons.expand_more,
                              size: 18,
                              color: AppColors.inkTertiary,
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (expanded) ...[
                      if (stop.showBanner) ...[
                        const SizedBox(height: 12),
                        PhotoPlaceholder(
                          icon: stop.kind.icon,
                          height: 132,
                          borderRadius: 16,
                          colors: stop.kind.banner,
                        ),
                      ],
                      const SizedBox(height: 8),
                      Text(
                        stop.summary,
                        style: text.bodyMedium?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                      if (stop.lightBadge != null) ...[
                        const SizedBox(height: 10),
                        PillBadge(
                          label: stop.lightBadge!,
                          icon: Icons.wb_sunny_outlined,
                          backgroundColor: AppColors.warning.withValues(
                            alpha: 0.15,
                          ),
                          foregroundColor: AppColors.warning,
                        ),
                      ],
                      if (stop.sunsetNote != null) ...[
                        const SizedBox(height: 10),
                        PillBadge(
                          label: stop.sunsetNote!,
                          icon: Icons.wb_twilight,
                          backgroundColor: AppColors.aiAccent.withValues(
                            alpha: 0.12,
                          ),
                          foregroundColor: AppColors.aiAccent,
                        ),
                      ],
                      if (stop.category != null) ...[
                        const SizedBox(height: 10),
                        PillBadge(
                          label: stop.category!,
                          icon: Icons.label_outline,
                        ),
                      ],
                      if (stop.chips.isNotEmpty) ...[
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            for (final chip in stop.chips)
                              PillBadge(label: chip),
                          ],
                        ),
                      ],
                      if (stop.photoGrid) ...[
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            for (
                              var i = 0;
                              i < stop.kind.banner.length && i < 3;
                              i++
                            ) ...[
                              if (i > 0) const SizedBox(width: 8),
                              Expanded(
                                child: PhotoPlaceholder(
                                  icon: stop.kind.icon,
                                  height: 72,
                                  borderRadius: 12,
                                  colors: [
                                    stop.kind.banner[i %
                                        stop.kind.banner.length],
                                    stop.kind.banner[(i + 1) %
                                        stop.kind.banner.length],
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                      if (stop.walkNote != null) ...[
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.directions_walk,
                              size: 16,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                stop.walkNote!,
                                style: text.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (stop.bookingRef != null) ...[
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: scheme.surfaceContainerHighest.withValues(
                              alpha: 0.45,
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.confirmation_number_outlined,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Booking reference',
                                      style: text.labelSmall,
                                    ),
                                    Text(
                                      stop.bookingRef!,
                                      style: text.titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: onSlip,
                                child: const Text('View Slip'),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (stop.aiNote != null) ...[
                        const SizedBox(height: 12),
                        AiBanner(label: 'Crowd alert', message: stop.aiNote!),
                      ],
                      if (stop.showSaveShare) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            IconButton(
                              tooltip: saved ? 'Unsave' : 'Save',
                              onPressed: onSave,
                              icon: Icon(
                                saved ? Icons.bookmark : Icons.bookmark_border,
                              ),
                              color: saved
                                  ? AppColors.primary
                                  : scheme.onSurfaceVariant,
                            ),
                            IconButton(
                              tooltip: 'Share stop',
                              onPressed: onShare,
                              icon: const Icon(Icons.ios_share),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MapCanvas extends StatelessWidget {
  const _MapCanvas({super.key, required this.stops, required this.plan});

  final List<ItineraryStop> stops;
  final DayPlan plan;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 180),
      children: [
        _DaySummary(plan: plan, stopCount: stops.length),
        const SizedBox(height: 12),
        Text(
          'Pins follow the ${plan.tabLabel} order. Switch back to the timeline from the map icon.',
          style: text.bodySmall,
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: SizedBox(
            height: 420,
            child: Stack(
              children: [
                const Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFD7E8FF),
                          Color(0xFFE7F6EE),
                          Color(0xFFF8E7D2),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: CustomPaint(
                    painter: _RoutePainter(count: stops.length),
                  ),
                ),
                for (var i = 0; i < stops.length; i++)
                  Align(
                    alignment: _pinAlignment(i),
                    child: _MapPin(index: i + 1, stop: stops[i]),
                  ),
                Positioned(
                  left: 12,
                  bottom: 12,
                  child: PillBadge(
                    label: plan.walking,
                    icon: Icons.directions_walk,
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Alignment _pinAlignment(int index) {
  const anchors = <Alignment>[
    Alignment(-0.55, -0.72),
    Alignment(0.35, -0.42),
    Alignment(-0.4, -0.05),
    Alignment(0.45, 0.28),
    Alignment(-0.15, 0.62),
    Alignment(0.2, 0.78),
  ];
  return anchors[index % anchors.length];
}

class _RoutePainter extends CustomPainter {
  const _RoutePainter({required this.count});

  final int count;

  @override
  void paint(Canvas canvas, Size size) {
    if (count < 2) return;
    final paint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.7)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final path = Path();
    for (var i = 0; i < count; i++) {
      final alignment = _pinAlignment(i);
      final point = alignment.alongSize(size);
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _RoutePainter oldDelegate) =>
      oldDelegate.count != count;
}

class _MapPin extends StatelessWidget {
  const _MapPin({required this.index, required this.stop});

  final int index;
  final ItineraryStop stop;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: stop.kind.color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Text(
            '$index',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          constraints: const BoxConstraints(maxWidth: 120),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.92),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            stop.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
        ),
      ],
    );
  }
}

class _AddPill extends StatelessWidget {
  const _AddPill({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: (isDark ? AppColors.cardDark : Colors.white).withValues(
              alpha: 0.88,
            ),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: isDark ? AppColors.hairlineDark : AppColors.hairline,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.add, size: 18, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Text(
                      'Add Place or AI Idea',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum StopKind { temple, coffee, food, shopping, cruise }

extension on StopKind {
  String get label => switch (this) {
    StopKind.temple => 'Temple',
    StopKind.coffee => 'Coffee',
    StopKind.food => 'Food',
    StopKind.shopping => 'Shopping',
    StopKind.cruise => 'Cruise',
  };

  IconData get icon => switch (this) {
    StopKind.temple => Icons.temple_buddhist,
    StopKind.coffee => Icons.coffee,
    StopKind.food => Icons.restaurant,
    StopKind.shopping => Icons.shopping_bag_outlined,
    StopKind.cruise => Icons.sailing,
  };

  Color get color => switch (this) {
    StopKind.temple => const Color(0xFFE85D4C),
    StopKind.coffee => const Color(0xFF8D6E63),
    StopKind.food => AppColors.warning,
    StopKind.shopping => AppColors.aiAccent,
    StopKind.cruise => AppColors.primary,
  };

  List<Color> get banner => switch (this) {
    StopKind.temple => const [Color(0xFFE85D4C), Color(0xFFF2A65A)],
    StopKind.coffee => const [Color(0xFF8D6E63), Color(0xFFD7CCC8)],
    StopKind.food => const [Color(0xFFFF9500), Color(0xFFE85D4C)],
    StopKind.shopping => const [
      Color(0xFF7C5CFF),
      Color(0xFF007AFF),
      Color(0xFF5AC8FA),
    ],
    StopKind.cruise => const [Color(0xFF5AC8FA), Color(0xFFFF9500)],
  };
}

enum StatusTone { neutral, success, warning, info }

extension on StatusTone {
  Color get background => switch (this) {
    StatusTone.neutral => const Color(0xFFE5E5EA),
    StatusTone.success => AppColors.success.withValues(alpha: 0.16),
    StatusTone.warning => AppColors.warning.withValues(alpha: 0.16),
    StatusTone.info => AppColors.primary.withValues(alpha: 0.12),
  };

  Color get foreground => switch (this) {
    StatusTone.neutral => AppColors.ink,
    StatusTone.success => const Color(0xFF1B7F34),
    StatusTone.warning => const Color(0xFF9A5B00),
    StatusTone.info => AppColors.primary,
  };
}

class TransitHop {
  const TransitHop({
    required this.line,
    required this.detail,
    required this.fare,
  });

  final String line;
  final String detail;
  final String fare;
}

class ItineraryStop {
  const ItineraryStop({
    required this.id,
    required this.time,
    required this.duration,
    required this.title,
    required this.summary,
    required this.kind,
    this.status,
    this.tone = StatusTone.neutral,
    this.lightBadge,
    this.sunsetNote,
    this.category,
    this.chips = const [],
    this.walkNote,
    this.bookingRef,
    this.transitBefore,
    this.aiNote,
    this.showBanner = false,
    this.photoGrid = false,
    this.showSaveShare = false,
  });

  final String id;
  final String time;
  final String duration;
  final String title;
  final String summary;
  final StopKind kind;
  final String? status;
  final StatusTone tone;
  final String? lightBadge;
  final String? sunsetNote;
  final String? category;
  final List<String> chips;
  final String? walkNote;
  final String? bookingRef;
  final TransitHop? transitBefore;
  final String? aiNote;
  final bool showBanner;
  final bool photoGrid;
  final bool showSaveShare;
}

class DayPlan {
  const DayPlan({
    required this.day,
    required this.tabLabel,
    required this.dateLabel,
    required this.weather,
    required this.theme,
    required this.walking,
    required this.pacing,
    required this.stops,
  });

  final int day;
  final String tabLabel;
  final String dateLabel;
  final String weather;
  final String theme;
  final String walking;
  final String pacing;
  final List<ItineraryStop> stops;
}

const List<DayPlan> _plans = [
  DayPlan(
    day: 1,
    tabLabel: 'Day 1 (Mon 14)',
    dateLabel: 'Mon 14 Oct',
    weather: 'Clear morning 17°C',
    theme: 'Shibuya arrival & Meiji quiet',
    walking: '3.1 km total walking',
    pacing: '~6 hrs pacing',
    stops: [
      ItineraryStop(
        id: 'meiji',
        time: '09:00 AM',
        duration: '1.5 hrs',
        title: 'Meiji Shrine walk',
        summary:
            'Gravel paths and a quiet courtyard before the city gets loud.',
        kind: StopKind.temple,
        status: 'Confirmed',
        tone: StatusTone.success,
        showBanner: true,
        showSaveShare: true,
      ),
      ItineraryStop(
        id: 'shibuya-coffee',
        time: '11:00 AM',
        duration: '40 min',
        title: 'Fuglen Shibuya',
        summary: 'First coffee after the flight, no reservation needed.',
        kind: StopKind.coffee,
        status: 'Rest & Refuel',
        tone: StatusTone.info,
        walkNote: '8 min walk from the shrine',
      ),
    ],
  ),
  DayPlan(
    day: 2,
    tabLabel: 'Day 2 (Tue 15)',
    dateLabel: 'Tue 15 Oct',
    weather: 'Perfect Autumn Weather 19°C',
    theme: 'Traditional Asakusa & Futuristic Akihabara',
    walking: '4.2 km total walking',
    pacing: '~7.5 hrs pacing',
    stops: [
      ItineraryStop(
        id: 'sensoji',
        time: '08:30 AM',
        duration: '1.5 hrs',
        title: 'Senso-ji Temple & Nakamise Dori',
        summary: 'Historic Buddhist temple complex, scenic thunder gate, and traditional morning snack street.',
        kind: StopKind.temple,
        status: 'Confirmed',
        tone: StatusTone.success,
        lightBadge: 'Best light at 08:45 AM',
        category: 'Culture & Heritage',
        showBanner: true,
        showSaveShare: true,
        aiNote: 'Crowd Alert: Senso-ji visitor volume triples by 09:45 AM. Starting earlier keeps the gardens quiet.',
      ),
      ItineraryStop(
        id: 'fuglen',
        time: '10:45 AM',
        duration: '45 min',
        title: 'Fuglen Asakusa',
        summary: 'Nordic pour-over coffee and cardamom rolls near the entertainment district.',
        kind: StopKind.coffee,
        status: 'Rest & Refuel',
        tone: StatusTone.info,
        walkNote: '4 min walk from Senso-ji',
      ),
      ItineraryStop(
        id: 'imahan',
        time: '12:30 PM',
        duration: '1 hr 15 min',
        title: 'Asakusa Imahan (Traditional Sukiyaki)',
        summary: 'Century-old room for marbled wagyu cooked table-side.',
        kind: StopKind.food,
        status: 'Reserved',
        tone: StatusTone.warning,
        bookingRef: 'IMH-2415',
      ),
      ItineraryStop(
        id: 'akihabara',
        time: '02:30 PM',
        duration: '2.0 hrs',
        title: 'Akihabara Electric Town & Mandarake',
        summary: 'Multi-floor electronics, retro games, and a Mandarake sweep.',
        kind: StopKind.shopping,
        status: 'Shopping & Tech',
        tone: StatusTone.info,
        chips: ['Electronics', 'Anime', 'Vintage'],
        photoGrid: true,
        transitBefore: TransitHop(
          line: 'Tsukuba Express line',
          detail: '4 mins (2 stops)',
          fare: '¥210',
        ),
      ),
      ItineraryStop(
        id: 'cruise',
        time: '06:00 PM',
        duration: '1 hr',
        title: 'Sumida River Sunset Cruise',
        summary: 'Low boat under the bridges as the river turns gold.',
        kind: StopKind.cruise,
        status: 'Ticket Ready',
        tone: StatusTone.success,
        sunsetNote: 'Sunset at 05:48 PM',
        showBanner: true,
      ),
    ],
  ),
  DayPlan(
    day: 3,
    tabLabel: 'Day 3 (Wed 16)',
    dateLabel: 'Wed 16 Oct',
    weather: 'Bright 18°C',
    theme: 'Toyosu morning & teamLab afternoon',
    walking: '2.4 km total walking',
    pacing: '~6.5 hrs pacing',
    stops: [
      ItineraryStop(
        id: 'toyosu',
        time: '08:00 AM',
        duration: '1.5 hrs',
        title: 'Toyosu Market breakfast',
        summary: 'Tuna bowls before the wholesale floors close to visitors.',
        kind: StopKind.food,
        status: 'Confirmed',
        tone: StatusTone.success,
      ),
      ItineraryStop(
        id: 'teamlab',
        time: '11:30 AM',
        duration: '90 min',
        title: 'teamLab Planets',
        summary: 'Barefoot water rooms. Tickets are already in the wallet.',
        kind: StopKind.temple,
        status: 'Ticket Ready',
        tone: StatusTone.success,
        showBanner: true,
      ),
    ],
  ),
  DayPlan(
    day: 4,
    tabLabel: 'Day 4 (Thu 17)',
    dateLabel: 'Thu 17 Oct',
    weather: 'High clouds 16°C',
    theme: 'Shinjuku lookouts & a late ramen',
    walking: '5.0 km total walking',
    pacing: '~7 hrs pacing',
    stops: [
      ItineraryStop(
        id: 'gov',
        time: '04:00 PM',
        duration: '1 hr',
        title: 'Metropolitan Government observatory',
        summary: 'Free lookout if the haze stays off the western hills.',
        kind: StopKind.temple,
        status: 'Confirmed',
        tone: StatusTone.success,
      ),
      ItineraryStop(
        id: 'ramen',
        time: '07:30 PM',
        duration: '45 min',
        title: 'Omoide Yokocho ramen',
        summary: 'A short alley counter, no reservation.',
        kind: StopKind.food,
        status: 'Walk-in',
        tone: StatusTone.neutral,
      ),
    ],
  ),
  DayPlan(
    day: 5,
    tabLabel: 'Day 5 (Fri 18)',
    dateLabel: 'Fri 18 Oct',
    weather: 'Coastal breeze 18°C',
    theme: 'Kamakura day trip',
    walking: '6.4 km total walking',
    pacing: '~8 hrs pacing',
    stops: [
      ItineraryStop(
        id: 'daibutsu',
        time: '10:30 AM',
        duration: '1 hr',
        title: 'Great Buddha of Kamakura',
        summary: 'Open-air bronze and a short garden loop.',
        kind: StopKind.temple,
        status: 'Confirmed',
        tone: StatusTone.success,
        showBanner: true,
      ),
    ],
  ),
  DayPlan(
    day: 6,
    tabLabel: 'Day 6 (Sat 19)',
    dateLabel: 'Sat 19 Oct',
    weather: 'Mild 17°C',
    theme: 'Harajuku shops & Yoyogi park',
    walking: '3.8 km total walking',
    pacing: '~5 hrs pacing',
    stops: [
      ItineraryStop(
        id: 'yoyogi',
        time: '11:00 AM',
        duration: '2 hrs',
        title: 'Yoyogi Park picnic',
        summary: 'A slow lawn hour before the weekend streets fill.',
        kind: StopKind.coffee,
        status: 'Flexible',
        tone: StatusTone.neutral,
      ),
      ItineraryStop(
        id: 'harajuku',
        time: '02:00 PM',
        duration: '2 hrs',
        title: 'Takeshita side streets',
        summary: 'Crepes, vintage floors, and an early exit before the crush.',
        kind: StopKind.shopping,
        status: 'Shopping',
        tone: StatusTone.info,
        chips: ['Vintage', 'Street food'],
        photoGrid: true,
      ),
    ],
  ),
];
