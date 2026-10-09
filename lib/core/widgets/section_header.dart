import 'package:flutter/material.dart';

/// A row with a section title and an optional trailing text action,
/// e.g. "See all".
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.trailingLabel,
    this.onTrailingTap,
  });

  final String title;
  final String? trailingLabel;
  final VoidCallback? onTrailingTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        if (trailingLabel != null)
          TextButton(onPressed: onTrailingTap, child: Text(trailingLabel!)),
      ],
    );
  }
}
