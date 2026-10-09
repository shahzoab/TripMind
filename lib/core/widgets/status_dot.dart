import 'package:flutter/material.dart';

import '../design/design_tokens.dart';

class StatusDot extends StatelessWidget {
  const StatusDot({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DesignMetrics.statusDot,
      height: DesignMetrics.statusDot,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
