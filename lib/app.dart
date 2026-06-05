// lib/app.dart
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokabee/0_core/1_constants/design_system/colors.dart';
import 'package:vokabee/0_core/1_constants/design_system/typography.dart';
import 'package:vokabee/5_di/app_router.dart';

class VokabeeApp extends ConsumerWidget {
  const VokabeeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Vokabee',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: _buildTheme(),
    );
  }

  ThemeData _buildTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: AppTypography.bodyFont,
      scaffoldBackgroundColor: AppColors.voidBlack,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.imperialGold,
        onPrimary: AppColors.voidBlack,
        secondary: AppColors.royalPurple,
        onSecondary: AppColors.pureWhite,
        surface: AppColors.deepRoyal,
        onSurface: AppColors.pureWhite,
        error: AppColors.error,
        onError: AppColors.pureWhite,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.voidBlack,
        foregroundColor: AppColors.pureWhite,
        titleTextStyle: AppTypography.headlineSmall.copyWith(
          color: AppColors.pureWhite,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.imperialGold,
          foregroundColor: AppColors.voidBlack,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: AppTypography.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.imperialGold,
          textStyle: AppTypography.labelMedium,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.deepRoyal,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2A2A40)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(color: AppColors.imperialGold, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.silverMist,
        ),
      ),
      cardColor: AppColors.deepRoyal,
      dividerColor: const Color(0xFF2A2A40),
      iconTheme: const IconThemeData(
        color: AppColors.pureWhite,
        size: 24,
      ),
    );
  }
}