import 'package:flutter/material.dart';

import '../design/design_tokens.dart';

class AppErrorState extends StatelessWidget {
  const AppErrorState({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(DesignSpacing.marginMobile),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Could not finish that',
              style: DesignType.headlineSm.copyWith(color: palette.onSurface),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: DesignSpacing.spaceSm),
            Text(
              message,
              style: DesignType.bodyMd.copyWith(color: palette.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: DesignSpacing.spaceLg),
            TextButton(
              onPressed: onRetry,
              child: Text(
                'Retry',
                style: DesignType.titleCard.copyWith(color: DesignColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
