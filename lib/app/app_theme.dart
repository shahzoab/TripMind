import 'package:flutter/material.dart';

import '../core/colors.dart';

class AppTheme {
  AppTheme._();

  static const String fontFamily = 'Inter';

  static final ThemeData light = _build(Brightness.light);
  static final ThemeData dark = _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final onSurface = isDark ? const Color(0xFFF3F0F2) : AppColors.textPrimary;
    final onSurfaceVariant = isDark
        ? const Color(0xFFC7C7CC)
        : AppColors.textSecondary;

    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.aiAccent,
      onSecondary: Colors.white,
      tertiary: AppColors.success,
      onTertiary: Colors.white,
      error: AppColors.danger,
      onError: Colors.white,
      surface: isDark ? AppColors.canvasDark : AppColors.canvasLight,
      onSurface: onSurface,
      onSurfaceVariant: onSurfaceVariant,
      outline: AppColors.textSecondary,
      outlineVariant: isDark ? AppColors.hairlineDark : AppColors.inputBorder,
      surfaceContainerLowest: isDark ? AppColors.cardDark : AppColors.card,
      surfaceContainerLow: isDark ? AppColors.cardDark : AppColors.card,
      surfaceContainer: isDark ? AppColors.cardDark : AppColors.card,
      surfaceContainerHigh: isDark ? AppColors.cardDark : AppColors.card,
      surfaceContainerHighest: isDark
          ? AppColors.cardDark
          : const Color(0xFFE5E5EA),
    );

    TextStyle style({
      required double size,
      required FontWeight weight,
      required double height,
      double letterSpacing = 0,
      Color? color,
    }) {
      return TextStyle(
        fontSize: size,
        fontWeight: weight,
        height: height / size,
        letterSpacing: letterSpacing,
        color: color ?? onSurface,
      );
    }

    // Inter is bundled via the fontFamily below. google_fonts' text theme
    // currently clashes with Flutter's TextTheme, so the family is applied
    // directly.
    final textTheme = TextTheme(
      headlineLarge: style(
        size: 28,
        weight: FontWeight.w700,
        height: 34,
        letterSpacing: -0.56,
      ),
      headlineMedium: style(
        size: 22,
        weight: FontWeight.w600,
        height: 28,
        letterSpacing: -0.33,
      ),
      headlineSmall: style(
        size: 18,
        weight: FontWeight.w600,
        height: 24,
        letterSpacing: -0.18,
      ),
      titleMedium: style(
        size: 16,
        weight: FontWeight.w600,
        height: 22,
        letterSpacing: -0.08,
      ),
      bodyLarge: style(size: 16, weight: FontWeight.w400, height: 24),
      bodyMedium: style(
        size: 14,
        weight: FontWeight.w400,
        height: 20,
        color: onSurfaceVariant,
      ),
      bodySmall: style(
        size: 13,
        weight: FontWeight.w400,
        height: 18,
        color: onSurfaceVariant,
      ),
      labelMedium: style(
        size: 12,
        weight: FontWeight.w600,
        height: 16,
        letterSpacing: 0.12,
      ),
      labelSmall: style(
        size: 11,
        weight: FontWeight.w600,
        height: 14,
        letterSpacing: 0.22,
        color: AppColors.textMetadata,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      cardTheme: CardThemeData(
        elevation: 0,
        color: isDark ? AppColors.cardDark : AppColors.card,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.card),
        ),
        margin: EdgeInsets.zero,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: onSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.headlineSmall,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          textStyle: textTheme.labelMedium?.copyWith(color: Colors.white),
          // Width stays flexible so buttons inside a Row are not forced
          // to expand. Height matches the shared control size.
          minimumSize: const Size(0, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.button),
          ),
        ),
      ),
    );
  }
}
