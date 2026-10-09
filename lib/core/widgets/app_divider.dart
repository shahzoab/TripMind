import 'package:flutter/material.dart';

import '../design/design_tokens.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    return ColoredBox(
      color: palette.outline.withValues(alpha: 0.35),
      child: const SizedBox(height: DesignMetrics.underline, width: double.infinity),
    );
  }
}
