import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF0D6EFD);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryDark = Color(0xFF052C65);
  static const Color primaryContainer = Color(0xFFCFE2FF);
  static const Color onPrimaryContainer = Color(0xFF052C65);

  static const Color secondary = Color(0xFF6C757D);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFE9ECEF);
  static const Color onSecondaryContainer = Color(0xFF212529);

  static const Color success = Color(0xFF198754);
  static const Color danger = Color(0xFFDC3545);
  static const Color warning = Color(0xFFFFC107);
  static const Color orange = Color(0xFFFD7E14);
  static const Color info = Color(0xFF0DCAF0);

  static const Color light = Color(0xFFF8F9FA);
  static const Color dark = Color(0xFF212529);

  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceContainerLowest = Color(0xFFF8F9FA);
  static const Color surfaceContainerLow = Color(0xFFF8F9FA);
  static const Color onSurface = Color(0xFF212529);
  static const Color onSurfaceVariant = Color(0xFF6C757D);

  static const Color outline = Color(0xFFADB5BD);
  static const Color outlineVariant = Color(0xFFDEE2E6);

  static const Color error = Color(0xFFDC3545);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFF8D7DA);
  static const Color onErrorContainer = Color(0xFF842029);

  static const Color tertiary = Color(0xFF6F42C1);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFE2D9F3);
  static const Color onTertiaryContainer = Color(0xFF3B1F7E);

  static const Color sidebarBackground = Color(0xFF212529);
  static const Color sidebarOnBackground = Color(0xFFFFFFFF);
  static const Color sidebarOnBackgroundVariant = Color(0xFFADB5BD);
  static const Color sidebarSelectedLabel = Color(0xFFFFFFFF);
}

abstract final class AppRadius {
  static const double md = 6;
}

class AppTheme {
  static ThemeData get light {
    const scheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.onPrimaryContainer,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      secondaryContainer: AppColors.secondaryContainer,
      onSecondaryContainer: AppColors.onSecondaryContainer,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
      tertiaryContainer: AppColors.tertiaryContainer,
      onTertiaryContainer: AppColors.onTertiaryContainer,
      error: AppColors.error,
      onError: AppColors.onError,
      errorContainer: AppColors.errorContainer,
      onErrorContainer: AppColors.onErrorContainer,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      onSurfaceVariant: AppColors.onSurfaceVariant,
      surfaceContainerLowest: AppColors.surfaceContainerLowest,
      surfaceContainerLow: AppColors.surfaceContainerLow,
      outline: AppColors.outline,
      outlineVariant: AppColors.outlineVariant,
      shadow: Colors.black,
      scrim: Colors.black,
      inverseSurface: AppColors.dark,
      onInverseSurface: AppColors.light,
      inversePrimary: AppColors.primaryContainer,
      surfaceTint: Colors.transparent,
    );

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      side: const BorderSide(color: AppColors.outlineVariant),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.surfaceContainerLowest,
      dividerTheme: const DividerThemeData(
        color: AppColors.outlineVariant,
        thickness: 1,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.surface,
        clipBehavior: Clip.antiAlias,
        shape: shape,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: _inputBorder(),
        enabledBorder: _inputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        errorBorder: _inputBorder(),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.error),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: AppColors.sidebarBackground,
        indicatorColor: AppColors.primary,
        selectedIconTheme: const IconThemeData(
          color: AppColors.sidebarOnBackground,
        ),
        unselectedIconTheme: const IconThemeData(
          color: AppColors.sidebarOnBackgroundVariant,
        ),
        selectedLabelTextStyle: const TextStyle(
          color: AppColors.sidebarSelectedLabel,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelTextStyle: const TextStyle(
          color: AppColors.sidebarOnBackgroundVariant,
        ),
      ),
      tabBarTheme: const TabBarThemeData(
        dividerColor: Colors.transparent,
        labelColor: AppColors.onPrimaryContainer,
        unselectedLabelColor: AppColors.onSurfaceVariant,
        labelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        indicatorColor: AppColors.primaryContainer,
      ),
    );
  }

  static OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.outlineVariant),
    );
  }
}