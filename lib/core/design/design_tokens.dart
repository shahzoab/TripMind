import 'package:flutter/material.dart';

/// Design tokens from DESIGN.md. Widgets read these names and do not
/// introduce their own colors, type sizes, spacing, or radii.
class DesignColors {
  DesignColors._();

  static const Color surface = Color(0xFFFCF8FB);
  static const Color surfaceDim = Color(0xFFDCD9DC);
  static const Color surfaceBright = Color(0xFFFCF8FB);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF6F3F5);
  static const Color surfaceContainer = Color(0xFFF0EDEF);
  static const Color surfaceContainerHigh = Color(0xFFEAE7EA);
  static const Color surfaceContainerHighest = Color(0xFFE4E2E4);
  static const Color onSurface = Color(0xFF1B1B1D);
  static const Color onSurfaceVariant = Color(0xFF414755);
  static const Color inverseSurface = Color(0xFF303032);
  static const Color inverseOnSurface = Color(0xFFF3F0F2);
  static const Color outline = Color(0xFF717786);
  static const Color outlineVariant = Color(0xFFC1C6D7);
  static const Color surfaceTint = Color(0xFF005BC1);
  static const Color primary = Color(0xFF0058BC);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF0070EB);
  static const Color onPrimaryContainer = Color(0xFFFEFCFF);
  static const Color inversePrimary = Color(0xFFADC6FF);
  static const Color secondary = Color(0xFF5E39E0);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFF7757FA);
  static const Color onSecondaryContainer = Color(0xFFFFFBFF);
  static const Color tertiary = Color(0xFF006B27);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFF008733);
  static const Color onTertiaryContainer = Color(0xFFF7FFF2);
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);
  static const Color primaryFixed = Color(0xFFD8E2FF);
  static const Color primaryFixedDim = Color(0xFFADC6FF);
  static const Color onPrimaryFixed = Color(0xFF001A41);
  static const Color onPrimaryFixedVariant = Color(0xFF004493);
  static const Color secondaryFixed = Color(0xFFE6DEFF);
  static const Color secondaryFixedDim = Color(0xFFCABEFF);
  static const Color onSecondaryFixed = Color(0xFF1C0062);
  static const Color onSecondaryFixedVariant = Color(0xFF4816CB);
  static const Color tertiaryFixed = Color(0xFF72FE88);
  static const Color tertiaryFixedDim = Color(0xFF53E16F);
  static const Color onTertiaryFixed = Color(0xFF002107);
  static const Color onTertiaryFixedVariant = Color(0xFF00531C);
  static const Color background = Color(0xFFFCF8FB);
  static const Color onBackground = Color(0xFF1B1B1D);
  static const Color surfaceVariant = Color(0xFFE4E2E4);

  /// Primary action from the palette rules.
  static const Color primaryAction = Color(0xFF007AFF);

  /// Confirmed / on-time.
  static const Color success = Color(0xFF34C759);

  /// Caution / delayed / pending.
  static const Color warning = Color(0xFFFF9500);

  /// Disrupted / cancelled.
  static const Color danger = Color(0xFFFF3B30);

  /// Timeline spine, light mode.
  static const Color spine = Color(0xFFE5E5EA);

  static const Color canvasDark = Color(0xFF0D0E12);
  static const Color cardDark = Color(0xFF1A1C23);
  static const Color hairlineDark = Color(0xFF2E313D);
  static const Color onSurfaceDark = Color(0xFFF3F0F2);
  static const Color onSurfaceVariantDark = Color(0xFFC7C7CC);

  /// AI intelligence spectrum, 135 degrees.
  static const LinearGradient ai = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF7C5CFF), Color(0xFF007AFF)],
  );
}

class DesignSpacing {
  DesignSpacing._();

  static const double spaceXs = 4;
  static const double spaceSm = 8;
  static const double spaceMd = 16;
  static const double spaceLg = 20;
  static const double spaceXl = 24;
  static const double gutter = 16;
  static const double gutterSm = 12;
  static const double margin = 20;
  static const double marginMobile = 16;
}

class DesignRadius {
  DesignRadius._();

  static const double sm = 4;
  static const double base = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double full = 9999;
}

class DesignMetrics {
  DesignMetrics._();

  static const double touchTarget = 44;
  static const double inputHeight = 52;
  static const double statusDot = 6;
  static const double spine = 2;
  static const double spineOffset = 28;
  static const double node = 32;
  static const double radio = 20;
  static const double fab = 56;
  static const double navHeight = 64;
  static const double underline = 2;
  static const double fabAboveDock =
      DesignSpacing.marginMobile +
      navHeight +
      DesignSpacing.marginMobile +
      DesignSpacing.spaceLg;
}

class DesignType {
  DesignType._();

  static const String family = 'Inter';

  static const TextStyle displayTransit = TextStyle(
    fontFamily: family,
    fontSize: 36,
    fontWeight: FontWeight.w800,
    height: 40 / 36,
    letterSpacing: -1.08,
  );

  static const TextStyle headlineLg = TextStyle(
    fontFamily: family,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 34 / 28,
    letterSpacing: -0.56,
  );

  static const TextStyle headlineMd = TextStyle(
    fontFamily: family,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 28 / 22,
    letterSpacing: -0.33,
  );

  static const TextStyle headlineSm = TextStyle(
    fontFamily: family,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 24 / 18,
    letterSpacing: -0.18,
  );

  static const TextStyle titleCard = TextStyle(
    fontFamily: family,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 22 / 16,
    letterSpacing: -0.08,
  );

  static const TextStyle bodyLg = TextStyle(
    fontFamily: family,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
  );

  static const TextStyle bodyMd = TextStyle(
    fontFamily: family,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
  );

  static const TextStyle bodySm = TextStyle(
    fontFamily: family,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 18 / 13,
  );

  static const TextStyle labelCode = TextStyle(
    fontFamily: family,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 24 / 20,
    letterSpacing: 0.8,
  );

  static const TextStyle labelPill = TextStyle(
    fontFamily: family,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
    letterSpacing: 0.12,
  );

  static const TextStyle labelMeta = TextStyle(
    fontFamily: family,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 14 / 11,
    letterSpacing: 0.22,
  );
}

/// Shadows DESIGN.md defines, used only where the Stitch screen shows elevation.
class DesignElevation {
  DesignElevation._();

  static const List<BoxShadow> tier1 = [
    BoxShadow(
      color: Color(0x0D000000),
      blurRadius: 20,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x05000000),
      blurRadius: 3,
      offset: Offset(0, 1),
    ),
  ];

  static const List<BoxShadow> tier2 = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 32,
      offset: Offset(0, 12),
    ),
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 6,
      offset: Offset(0, 2),
    ),
  ];
}

class DesignPalette {
  const DesignPalette._({
    required this.surface,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.lowest,
    required this.containerLow,
    required this.container,
    required this.containerHigh,
    required this.spine,
    required this.outline,
  });

  factory DesignPalette.of(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    if (dark) {
      return const DesignPalette._(
        surface: DesignColors.canvasDark,
        onSurface: DesignColors.onSurfaceDark,
        onSurfaceVariant: DesignColors.onSurfaceVariantDark,
        lowest: DesignColors.cardDark,
        containerLow: DesignColors.cardDark,
        container: DesignColors.cardDark,
        containerHigh: DesignColors.hairlineDark,
        spine: DesignColors.hairlineDark,
        outline: DesignColors.onSurfaceVariantDark,
      );
    }
    return const DesignPalette._(
      surface: DesignColors.surface,
      onSurface: DesignColors.onSurface,
      onSurfaceVariant: DesignColors.onSurfaceVariant,
      lowest: DesignColors.surfaceContainerLowest,
      containerLow: DesignColors.surfaceContainerLow,
      container: DesignColors.surfaceContainer,
      containerHigh: DesignColors.surfaceContainerHigh,
      spine: DesignColors.spine,
      outline: DesignColors.outline,
    );
  }

  final Color surface;
  final Color onSurface;
  final Color onSurfaceVariant;
  final Color lowest;
  final Color containerLow;
  final Color container;
  final Color containerHigh;
  final Color spine;
  final Color outline;
}
