import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  AppTypography._();

  // ═══════════════════════════════
  // 🔤 FONTS
  // ═══════════════════════════════
  static const String bodyFont = 'Nunito';

  // ═══════════════════════════════
  // 👑 DISPLAY — Cormorant Garamond (Royal)
  // ═══════════════════════════════
  static TextStyle get displayLarge => GoogleFonts.cormorantGaramond(
        fontSize: 57,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.25,
      );

  static TextStyle get displayMedium => GoogleFonts.cormorantGaramond(
        fontSize: 45,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get displaySmall => GoogleFonts.cormorantGaramond(
        fontSize: 36,
        fontWeight: FontWeight.w600,
      );

  // ═══════════════════════════════
  // 📰 HEADLINE — Nunito
  // ═══════════════════════════════
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 32,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  // ═══════════════════════════════
  // 📝 TITLE — Nunito
  // ═══════════════════════════════
  static const TextStyle titleLarge = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  // ═══════════════════════════════
  // 📖 BODY — Inter
  // ═══════════════════════════════
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      );

  // ═══════════════════════════════
  // 🏷️ LABEL — Nunito
  // ═══════════════════════════════
  static const TextStyle labelLarge = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.1,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
}