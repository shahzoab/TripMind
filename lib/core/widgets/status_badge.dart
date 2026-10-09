import 'package:flutter/material.dart';

import '../colors.dart';

/// Trip status shown by [StatusBadge].
enum StatusBadgeKind { confirmed, pending, delayed }

/// A pill for confirmed, pending, and delayed states.
class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.kind, this.label});

  final StatusBadgeKind kind;
  final String? label;

  Color get _color => switch (kind) {
    StatusBadgeKind.confirmed => AppColors.success,
    StatusBadgeKind.pending => AppColors.warning,
    StatusBadgeKind.delayed => AppColors.danger,
  };

  String get _label =>
      label ??
      switch (kind) {
        StatusBadgeKind.confirmed => 'Confirmed',
        StatusBadgeKind.pending => 'Pending',
        StatusBadgeKind.delayed => 'Delayed',
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Text(
        _label,
        style: Theme.of(context).textTheme.labelMedium
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}
