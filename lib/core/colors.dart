import 'package:flutter/material.dart';

/// Brand colors shared across tripMind.
///
/// Primary actions stay #007AFF. Text and status colors follow the
/// light-mode design tokens.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF007AFF);
  static const Color aiTeal = Color(0xFF0D9488);
  static const Color aiCyan = Color(0xFF06B6D4);

  /// Solid stand-in for the AI gradient, used by icons and borders.
  static const Color aiAccent = aiTeal;

  static const Color success = Color(0xFF34C759);
  static const Color warning = Color(0xFFFF9500);
  static const Color danger = Color(0xFFFF3B30);

  static const Color canvasLight = Color(0xFFF5F5F7);
  static const Color canvasDark = Color(0xFF0D0E12);
  static const Color card = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1A1C23);
  static const Color ink = Color(0xFF1C1C1E);
  static const Color inkSecondary = Color(0xFF6E6E73);
  static const Color inkTertiary = Color(0xFFA1A1A6);
  static const Color hairline = Color(0x0A000000);
  static const Color hairlineDark = Color(0xFF2E313D);
  static const Color inputBorder = Color(0xFFE5E5EA);

  static const Color textPrimary = ink;
  static const Color textSecondary = inkSecondary;
  static const Color textMetadata = inkTertiary;

  static const LinearGradient aiGradient = AppGradients.ai;
}

/// Shared gradients. [ai] is the cyber-mint to blue AI accent.
class AppGradients {
  AppGradients._();

  static const LinearGradient ai = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [AppColors.aiTeal, AppColors.aiCyan, AppColors.primary],
  );

  /// Two-stop gradient used for the "AI copilot" headline treatment.
  static const LinearGradient aiText = LinearGradient(
    colors: [AppColors.aiCyan, AppColors.primary],
  );
}

/// Corner radii used by cards, buttons, and pill controls.
class AppRadii {
  AppRadii._();

  static const double card = 20;
  static const double button = 16;
  static const double pill = 28;
}

/// Elevation shadows. [soft] is the standard card shadow.
class AppShadows {
  AppShadows._();

  static final List<BoxShadow> soft = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];
}
