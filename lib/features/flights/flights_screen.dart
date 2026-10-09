import 'package:flutter/material.dart';

import '../../core/design/design_tokens.dart';

/// Flights tab. Empty until a flight feed is connected.
class FlightsScreen extends StatelessWidget {
  const FlightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    return Scaffold(
      backgroundColor: palette.surface,
      appBar: AppBar(
        backgroundColor: palette.surface,
        title: Text(
          'Flights',
          style: DesignType.headlineSm.copyWith(color: palette.onSurface),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignSpacing.marginMobile),
          child: Text(
            'No flights yet',
            style: DesignType.headlineSm.copyWith(color: palette.onSurface),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
