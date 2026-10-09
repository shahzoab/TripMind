import 'package:flutter/material.dart';

import '../colors.dart';

/// A banner used to surface tripMind's AI-generated suggestions and notes.
class AiBanner extends StatelessWidget {
  const AiBanner({
    super.key,
    required this.label,
    required this.message,
    this.actions = const [],
    this.trailing,
    this.footer,
  });

  final String label;
  final String message;
  final List<Widget> actions;

  /// Optional status shown on the right of the label row.
  final Widget? trailing;

  /// Optional content under the message, such as a verification line.
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [
            AppColors.aiAccent.withValues(alpha: 0.05),
            AppColors.primary.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: AppColors.aiAccent.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.auto_awesome,
                size: 16,
                color: AppColors.aiAccent,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    color: AppColors.aiAccent,
                  ),
                ),
              ),
              ?trailing,
            ],
          ),
          const SizedBox(height: 8),
          Text(message, style: Theme.of(context).textTheme.bodyMedium),
          if (footer != null) ...[
            const SizedBox(height: 12),
            footer!,
          ],
          if (actions.isNotEmpty) ...[
            const SizedBox(height: 12),
            Row(children: actions),
          ],
        ],
      ),
    );
  }
}
